# Portability Rule

fabric.db core must have no vendor lock-in.

The core defines contracts, primitives, schemas, records, and conformance expectations. It must not require any specific vendor, operating system, database, cloud, runtime, or packaging system.

## Core rule

```text
Core = portable contracts
Profiles = replaceable implementations
```

## Core must not depend on

- Ubuntu
- Canonical
- SurrealDB
- Docker
- Kubernetes
- GitHub
- GHCR
- OpenStack
- Snap
- systemd
- any cloud provider
- any single identity provider
- any single policy engine

These may be supported profiles, but they cannot become core requirements.

## Core may define

- identity contract
- state contract
- event contract
- policy contract
- decision contract
- provenance contract
- reconciliation contract
- conformance contract
- federation contract

## Implementation profiles

Supported implementation profiles may include:

```text
ubuntu-core-profile
ubuntu-server-profile
microstack-profile
linux-container-profile
kubernetes-profile
sqlite-profile
postgres-profile
surrealdb-profile
nats-profile
opa-profile
openfga-profile
spiffe-profile
```

Profiles are optional and replaceable.

## Dependency boundary

```text
fabric.db core
    = stable, portable, vendor-neutral

microbox profile
    = concrete implementation choice

vendor component
    = replaceable material
```

## Principle

No implementation material may define the shape of the core.

The core defines what must be true.
Profiles define how it is built in a given environment.
