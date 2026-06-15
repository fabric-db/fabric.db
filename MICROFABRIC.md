# microfabric

A microfabric is the smallest deployable fabric unit.

It is a local, bounded, governed state kernel that can run independently while still speaking the same contracts as the wider fabric.

## Definition

A microfabric is a self-contained fabric.db kernel instance with:

- identity
- state
- events
- policy
- decisions
- provenance
- reconciliation
- conformance

It is small enough to run at the edge, inside a product, inside a tenant, inside a workspace, or inside an isolated environment.

## Purpose

A microfabric exists to make governance local.

It lets a system act, record, evaluate, and reconcile without depending on a central control plane for every decision.

## Boundary

A microfabric owns local truth.

It does not own global truth.

It can emit, receive, and reconcile with other fabrics through explicit contracts.

## Core responsibilities

A microfabric must:

1. identify every actor
2. type every state object
3. record every event
4. bind every governed action to policy
5. preserve decision context
6. preserve provenance
7. detect drift
8. reconcile state
9. expose conformance status
10. remain small and auditable

## Non-goals

A microfabric does not own:

- global orchestration
- user interface
- model routing
- vendor integration logic
- business-specific workflows
- cross-tenant policy authority

Those are external systems that connect to the microfabric through contracts.

## Relationship to fabric.db

fabric.db is the kernel specification.

A microfabric is one deployable instance of that kernel.

```text
fabric.db        = kernel specification
microfabric      = deployable kernel unit
fabric network   = cooperating microfabrics
```

## Principle

Do not centralize what must be locally accountable.

Do not decentralize what must be governed.

A microfabric is local accountability with explicit federation.
