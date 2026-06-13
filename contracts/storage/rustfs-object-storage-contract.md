# RustFS Object Storage Contract for Fabric

Status: Draft v0.1  
Scope: Fabric object payload storage provider  
License intent: Open source, provider-neutral, S3-compatible

## Purpose

Fabric governs meaning, identity, policy, provenance, and relationships. Heavy object payloads are stored outside the graph in an S3-compatible object store.

RustFS is adopted as a preferred self-hosted object storage candidate because it is Rust-native, S3-compatible, and positioned around a long-term open-source commitment.

This contract keeps Fabric provider-neutral: RustFS is a preferred implementation, while S3 remains the storage interface.

## Principle

> Fabric does not store everything. Fabric governs everything.

Object storage stores payloads. Fabric stores the trust layer around those payloads.

## Responsibilities

### RustFS / S3-compatible object storage

RustFS or another S3-compatible provider is responsible for:

- Original file payloads
- Agent outputs
- Evidence bundles
- Dataset snapshots
- Logs and replay artifacts
- Model outputs and generated media
- Immutable payload versions
- Binary and large object retention

### Fabric / SurrealDB

Fabric is responsible for:

- Object identity
- Box identity
- Actor identity
- DID and VC references
- Object metadata
- Schema.org JSON-LD records
- Access relationships
- Policy decisions
- Provenance
- Hashes and signatures
- Event links
- Replay pointers
- Audit state

## Canonical Mapping

```text
Box payloads   -> RustFS / S3 object storage
Box identity   -> DID / VC
Box metadata   -> Fabric / SurrealDB
Box relations  -> Fabric graph
Box policy     -> OPA + OpenFGA
Box evidence   -> immutable object + signed metadata
Box replay     -> event log + object reference
```

## Provider Contract

Fabric storage providers must expose an S3-compatible interface or an adapter that satisfies the following operations:

- Put object
- Get object
- Delete object, if policy permits
- List object metadata
- Generate signed URL, if policy permits
- Verify object hash
- Record immutable version
- Attach object to a Box
- Attach provenance metadata
- Emit audit event

## Object Reference Shape

```json
{
  "box_id": "box_01HX...",
  "object_uri": "s3://fabric-evidence/org/project/run/output.json",
  "provider": "rustfs",
  "bucket": "fabric-evidence",
  "key": "org/project/run/output.json",
  "sha256": "...",
  "content_type": "application/json",
  "size_bytes": 0,
  "actor_did": "did:web:agent.example.com",
  "policy_decision_id": "pdp_...",
  "created_at": "2026-06-12T00:00:00Z"
}
```

## Access Control

Object access is deny-by-default.

A request to access an object must pass through:

1. Identity verification
2. Fabric metadata lookup
3. OpenFGA relationship check
4. OPA policy check
5. Audit event creation
6. Signed URL or direct stream issuance

No object URL should be treated as authority by itself.

## Deployment Position

```text
Ubuntu
k0s
Juju
Local-path / CSI storage
Caddy
RustFS              # object payloads
SurrealDB           # graph, metadata, policy records
Authentik           # SSO / identity
OpenFGA             # relationship authorization
OPA                 # policy decisioning
Prometheus
Grafana
Headlamp
```

## Provider Neutrality

RustFS is a preferred provider, not a hard dependency.

Compatible providers may include:

- RustFS
- MinIO
- Ceph Object Gateway
- AWS S3
- Cloudflare R2
- Garage
- Any S3-compatible provider that satisfies this contract

## Governance Rules

- Store lossless originals.
- Never overwrite without versioning.
- Hash every object.
- Bind every object to a Box.
- Bind every object to an actor.
- Bind every object to a policy decision.
- Store metadata in Fabric, not only in object headers.
- Preserve replayability.
- Preserve auditability.
- Separate object payload from governance metadata.

## Future Work

- Define `fabric.storage.v1` protocol schema.
- Add RustFS Helm/Juju deployment profile.
- Add S3 adapter test suite.
- Add object-retention policies.
- Add evidence-bundle signing.
- Add schema.org `MediaObject`, `DigitalDocument`, and `CreativeWork` mappings.
- Add OpenFGA tuple templates for object access.
- Add OPA policies for retention, deletion, and export.
