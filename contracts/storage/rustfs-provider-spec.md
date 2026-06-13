# RustFS Provider Implementation Spec

Status: Draft v0.1  
Parent contract: `contracts/storage/rustfs-object-storage-contract.md`  
Provider: RustFS  
Interface: S3-compatible object storage

## Goal

This document turns the RustFS object storage contract into an implementable provider profile for Fabric.

RustFS is used as the preferred local/self-hosted object storage provider. Fabric continues to depend on the S3-compatible contract, not on a RustFS-only API.

## Provider Name

```text
rustfs
```

## Runtime Role

RustFS stores large and immutable payloads for Fabric Boxes.

Fabric stores the metadata, identity, policy, provenance, relationships, and audit records around those payloads.

```text
payload bytes -> RustFS
payload meaning -> Fabric
payload authority -> OPA + OpenFGA
payload identity -> DID / VC
payload evidence -> hash + signature + event log
```

## Required Buckets

### `fabric-originals`

Stores lossless original files and raw uploads.

Rules:

- Append-only by default
- Versioning required
- Deletion requires policy approval
- Every object must have a Fabric Box reference

### `fabric-evidence`

Stores evidence bundles, run outputs, screenshots, generated artifacts, logs, and replay material.

Rules:

- Immutable by default
- Retention policy required
- Every object must be linked to an actor, decision, and run

### `fabric-datasets`

Stores dataset snapshots, exports, and evaluation inputs.

Rules:

- Dataset version required
- Hash manifest required
- Schema reference required
- Lineage reference required

### `fabric-model-artifacts`

Stores model outputs, embeddings exports, checkpoints, and model-adjacent artifacts when permitted.

Rules:

- Model provider reference required
- Usage-policy reference required
- Cost/run metadata required where applicable

### `fabric-public`

Stores objects explicitly approved for public distribution.

Rules:

- Public access is deny-by-default
- Publishing approval required
- Signed metadata required
- License metadata required

## Object Key Format

Recommended key shape:

```text
{tenant_id}/{workspace_id}/{box_id}/{yyyy}/{mm}/{dd}/{object_id}/{filename}
```

Example:

```text
org_agenext/ws_default/box_01HX/2026/06/12/obj_01HX/output.json
```

## Required Metadata

Every object must have a Fabric metadata record. Object-store headers are not enough.

Required Fabric fields:

```json
{
  "id": "object_01HX...",
  "box_id": "box_01HX...",
  "provider": "rustfs",
  "bucket": "fabric-evidence",
  "key": "org/ws/box/date/object/file.json",
  "uri": "s3://fabric-evidence/org/ws/box/date/object/file.json",
  "sha256": "...",
  "size_bytes": 0,
  "content_type": "application/json",
  "created_at": "2026-06-12T00:00:00Z",
  "created_by": "did:web:agent.example.com",
  "tenant_id": "tenant_...",
  "workspace_id": "workspace_...",
  "policy_decision_id": "pdp_...",
  "provenance_event_id": "event_...",
  "retention_policy_id": "retention_...",
  "schema_ref": "schema.org/MediaObject",
  "version": 1,
  "immutable": true
}
```

## Minimum Provider Operations

The RustFS provider adapter must implement:

```text
put_object(input) -> object_ref
get_object(input) -> object_stream
head_object(input) -> object_metadata
list_objects(input) -> object_metadata[]
delete_object(input) -> deletion_result
copy_object(input) -> object_ref
sign_read_url(input) -> signed_url
sign_write_url(input) -> signed_url
verify_object(input) -> verification_result
lock_object(input) -> lock_result
```

## Policy Gates

All operations must pass through Fabric policy gates.

### Write Gate

A write is allowed only when:

- The actor is authenticated
- The actor has write permission on the target Box or workspace
- The target bucket is allowed for the object class
- Content type is allowed
- Size is within policy
- Retention policy is resolved
- Audit event can be created

### Read Gate

A read is allowed only when:

- The actor is authenticated
- The object exists in Fabric metadata
- The actor has relationship-based access through OpenFGA
- OPA allows the operation
- The object is not under hold, quarantine, or restricted export
- A read audit event is created

### Delete Gate

A delete is allowed only when:

- The object is not immutable, or an approved legal/compliance override exists
- Retention period has expired, or policy permits deletion
- Actor has delete permission
- OPA approves the deletion
- Deletion event is recorded

## OpenFGA Relation Sketch

```text
type tenant
  relations
    define admin: [user, agent]
    define member: [user, agent]

type workspace
  relations
    define parent: [tenant]
    define owner: [user, agent]
    define editor: [user, agent]
    define viewer: [user, agent]

type box
  relations
    define parent: [workspace]
    define owner: [user, agent]
    define editor: [user, agent]
    define viewer: [user, agent]

type object
  relations
    define parent: [box]
    define owner: owner from parent
    define editor: editor from parent
    define viewer: viewer from parent
```

## OPA Policy Sketch

```rego
package fabric.storage

default allow := false

allow if {
  input.operation == "read"
  input.identity.authenticated == true
  input.openfga.allowed == true
  not input.object.quarantined
}

allow if {
  input.operation == "write"
  input.identity.authenticated == true
  input.openfga.allowed == true
  input.object.size_bytes <= input.policy.max_size_bytes
  input.object.content_type in input.policy.allowed_content_types
}

allow if {
  input.operation == "delete"
  input.identity.authenticated == true
  input.openfga.allowed == true
  input.object.immutable == false
  input.retention.expired == true
}
```

## SurrealDB Record Sketch

```sql
DEFINE TABLE storage_object SCHEMAFULL;

DEFINE FIELD box_id ON storage_object TYPE record<box>;
DEFINE FIELD provider ON storage_object TYPE string;
DEFINE FIELD bucket ON storage_object TYPE string;
DEFINE FIELD key ON storage_object TYPE string;
DEFINE FIELD uri ON storage_object TYPE string;
DEFINE FIELD sha256 ON storage_object TYPE string;
DEFINE FIELD size_bytes ON storage_object TYPE int;
DEFINE FIELD content_type ON storage_object TYPE string;
DEFINE FIELD created_at ON storage_object TYPE datetime;
DEFINE FIELD created_by ON storage_object TYPE string;
DEFINE FIELD policy_decision_id ON storage_object TYPE string;
DEFINE FIELD provenance_event_id ON storage_object TYPE string;
DEFINE FIELD retention_policy_id ON storage_object TYPE string;
DEFINE FIELD immutable ON storage_object TYPE bool DEFAULT true;
DEFINE FIELD version ON storage_object TYPE int DEFAULT 1;

DEFINE INDEX storage_object_uri_idx ON storage_object FIELDS uri UNIQUE;
DEFINE INDEX storage_object_box_idx ON storage_object FIELDS box_id;
DEFINE INDEX storage_object_hash_idx ON storage_object FIELDS sha256;
```

## Health Checks

The provider is healthy only when:

- RustFS endpoint is reachable
- S3 credentials are valid
- Required buckets exist
- A test object can be written and read
- Hash verification passes
- Policy gate is reachable
- Metadata DB is reachable

## Acceptance Criteria

- RustFS can store and retrieve object payloads through the S3 adapter.
- Every stored object has a Fabric metadata record.
- Every object has a hash.
- Every object maps to a Box.
- Read/write/delete actions create audit events.
- Access is denied unless OpenFGA and OPA both allow it.
- Provider can be replaced by another S3-compatible backend without changing Fabric data model.

## Next Build Step

Create `providers/rustfs/` with:

```text
providers/rustfs/README.md
providers/rustfs/docker-compose.yml
providers/rustfs/.env.example
providers/rustfs/buckets.md
providers/rustfs/policies.md
providers/rustfs/healthcheck.sh
```
