# AnyDB

**Any database. Any model. One governed Fabric.**

AnyDB is the database-independent capability of `fabric.db`. It provides a common control, identity, policy, provenance, event, trust, and reconciliation layer across heterogeneous data systems.

AnyDB does not claim that one storage engine should replace every database. Instead, it defines how different databases can participate in one governed operational fabric.

## Naming model

| Name | Meaning |
|---|---|
| **fabric.db** | The reference implementation and canonical specification repository |
| **AnyDB** | The database-independent product capability and category |
| **The Fabric** | The broader governed state architecture |
| **AnyDB Protocol** | The interoperability contract used by providers and adapters |

## Definition

> AnyDB is a database-independent fabric that connects relational, document, graph, vector, time-series, event, key-value, and object data through one identity, policy, provenance, and state model.

## What AnyDB standardizes

AnyDB standardizes the governance plane rather than forcing every system into one physical storage model.

It defines common contracts for:

- canonical resource identity
- tenant and workspace boundaries
- authentication and authorization context
- policy decisions and approvals
- commands and state transitions
- events and replay
- evidence and provenance
- assertions and trust
- audit history
- drift detection
- reconciliation
- provider capabilities
- conformance reporting

## Architecture

```text
Applications, Agents, Operators and APIs
                    |
              AnyDB Protocol
                    |
     Identity + Policy + Provenance + Trust
                    |
        State + Events + Reconciliation
                    |
   Provider and Adapter Capability Interface
                    |
 relational | document | graph | vector | time-series
 event log  | key-value | object | external service
```

## Core principle

A database becomes part of AnyDB when it can expose its capabilities through governed contracts and produce sufficient evidence for its state transitions.

A provider does not need to implement every data model. It must declare what it supports and conform to the contracts associated with those capabilities.

## Provider capability declaration

An AnyDB provider should publish a machine-readable capability document.

```json
{
  "$schema": "https://fabric.db/schemas/anydb-provider.schema.json",
  "provider": "example-provider",
  "version": "1.0.0",
  "models": ["document", "graph", "vector"],
  "capabilities": {
    "transactions": true,
    "temporalHistory": true,
    "changeEvents": true,
    "recordAuthorization": true,
    "fullTextSearch": true,
    "vectorSearch": true,
    "replay": true
  },
  "conformance": "anydb-core-v0.1"
}
```

## Conformance levels

### AnyDB Core

The provider supports canonical identity, governed state transitions, audit records, provenance, and capability discovery.

### AnyDB Event

The provider additionally supports durable change events, ordering metadata, idempotency, and replay.

### AnyDB Trust

The provider additionally supports evidence, assertions, verification status, and attributable policy decisions.

### AnyDB Reconciled

The provider additionally supports desired state, observed state, drift reporting, and deterministic reconciliation.

## Relationship to fabric.db

`fabric.db` supplies the canonical models and reference behavior for AnyDB. A deployment may use one multi-model database, several specialized databases, or external managed services.

The Fabric remains stable even when an underlying provider changes.

```text
AnyDB = stable governed interface
fabric.db = reference specification and implementation
provider = replaceable persistence or data service
```

## Product positioning

AnyDB should be described as:

- a governed database fabric
- a database-independent state layer
- a control plane for heterogeneous data
- a canonical interface across data models
- a trust and reconciliation layer for operational data

It should not be described as:

- a magical replacement for every database
- a universal query language with no semantic trade-offs
- an abstraction that hides all provider differences
- a guarantee that every backend offers identical consistency

## Taglines

Primary:

> Any database. Any model. One governed Fabric.

Technical:

> A stable governance and state interface across heterogeneous databases.

Agentic systems:

> Governed state for every agent, event, decision, and database.

## Initial scope

The first AnyDB specification should include:

1. provider capability schema
2. canonical identity contract
3. state-transition envelope
4. event and provenance envelope
5. policy-decision record
6. evidence and assertion record
7. reconciliation contract
8. conformance test profile

## Status

AnyDB is currently a proposed capability and specification family within `fabric.db`.
