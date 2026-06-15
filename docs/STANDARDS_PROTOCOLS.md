# Industry Standard Protocols.

FabricDB should bind to existing industry-standard protocols wherever possible.

The core remains protocol-first, open-source, and vendor-neutral.

Profiles bind FabricDB concepts to standards and mature open-source projects.

## Core mapping.

| Fabric concept | Standard or project profile | Role. |
|---|---|---|
| Box artifact. | OCI image. | Portable runtime artifact. |
| Builder. | CNCF Buildpacks. | Source-to-OCI builder profile. |
| Runtime orchestration. | Kubernetes. | Runtime/orchestration profile. |
| Gate guard. | OPA Gatekeeper. | Kubernetes admission controller profile. |
| Policy enforcement. | Open Policy Agent. | Policy decision/enforcement profile. |
| Fine-grained access. | OpenFGA / SpiceDB / ReBAC. | Relationship authorization profile. |
| Sync tunnel. | Apache SeaTunnel. | Data synchronization/tunnel profile. |
| Event envelope. | CloudEvents. | Event metadata profile. |
| API description. | OpenAPI. | HTTP/API contract profile. |
| Identity. | OIDC / DID / VC / SPIFFE. | Identity profile. |
| Container artifact. | OCI. | Artifact and image profile. |
| Observability. | OpenTelemetry. | Traces, metrics, logs profile. |
| Data description. | JSON Schema / JSON-LD. | Schema and linked-data profile. |

## Governance mapping.

```text
Agreement creates the bridge.
Tuplet defines the relation.
OpenFGA / SpiceDB defines fine-grained access.
OPA enforces governance policy.
Gatekeeper guards the Kubernetes gate.
Fabric Loop reconciles to stable state.
```

## Transport mapping.

```text
Box.
  moves as encrypted stream.

Tunnel.
  is governed stream path.

Apache SeaTunnel.
  is a replaceable data synchronization profile.

Cable / fibre.
  are transport material profiles.
```

## Build mapping.

```text
Source.
  goes to builder.

Buildpacks.
  builds OCI artifact.

OCI artifact.
  is not the box.

Box.
  is the building block.
```

## Access mapping.

```text
Node A.
Agreement Bridge.
Node B.

Both sides require fine-grained access gates.
Both sides are governed by their governance policies.
No unilateral bridge is valid.
```

## Non-lock-in rule.

No profile defines the core.

All standards and projects listed here are replaceable profiles.

The FabricDB core is:

```text
Node.
Box.
Agreement.
Tuplet.
Policy.
State.
Stream.
Fabric Loop.
Stable State.
```

## Source grounding.

CNCF Buildpacks are used as a profile for transforming source into OCI container images.

Open Policy Agent and Gatekeeper are used as profiles for policy enforcement and Kubernetes admission control.

OpenFGA, SpiceDB, and ReBAC are used as profiles for relationship-based fine-grained authorization.

Apache SeaTunnel is used as a profile for data synchronization and tunnel movement.
