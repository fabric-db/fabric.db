# AnyDB Domains

**Status:** Draft v0.1

AnyDB Domains define the major areas of state, governance, and data capability that an AnyDB provider or adapter may participate in.

A domain is not a physical database. A domain is a governed area of responsibility inside the Fabric.

## Domain map

```text
AnyDB
  |
  +-- Identity Domain
  +-- Policy Domain
  +-- State Domain
  +-- Event Domain
  +-- Evidence Domain
  +-- Trust Domain
  +-- Reconciliation Domain
  +-- Data Model Domain
  +-- Query Domain
  +-- Analytics Domain
  +-- Agent Domain
  +-- Operations Domain
  +-- Provider Domain
  +-- Marketplace Domain
```

## Core domains

### Identity Domain

Defines canonical identity for humans, agents, services, organizations, tenants, workspaces, resources, and providers.

Responsibilities:

- subject identity
- resource identity
- tenant and workspace boundaries
- DID and verifiable credential references
- service and provider identity
- lifecycle state

Canonical records:

- subject
- tenant
- workspace
- resource
- provider
- credential reference

### Policy Domain

Defines decisions, constraints, approvals, and authorization outcomes.

Responsibilities:

- authorization decisions
- approval gates
- risk classification
- deny-by-default behavior
- policy traces
- separation of duty

Canonical records:

- policy
- policy decision
- approval
- constraint
- obligation

### State Domain

Defines current, desired, and historical state for governed resources.

Responsibilities:

- current state
- desired state
- state versioning
- state transition envelopes
- schema validation
- state references

Canonical records:

- state
- desired state
- observed state
- transition
- snapshot

### Event Domain

Defines durable operational events and replay behavior.

Responsibilities:

- emitted events
- event ordering
- idempotency
- replay windows
- subscriptions
- event provenance

Canonical records:

- event
- event stream
- replay cursor
- idempotency record

### Evidence Domain

Defines proof that a transition, observation, decision, or assertion happened.

Responsibilities:

- evidence references
- source artifacts
- checksums
- signatures
- timestamps
- evidence retention

Canonical records:

- evidence
- artifact reference
- checksum
- signature
- observation

### Trust Domain

Defines assertions over identity, state, evidence, and provider behavior.

Responsibilities:

- trust assertions
- verification status
- revocation
- disputes
- trust score inputs
- issuer accountability

Canonical records:

- assertion
- verification
- revocation
- dispute
- trust score

### Reconciliation Domain

Defines control-loop behavior across desired state and observed state.

Responsibilities:

- drift detection
- repair planning
- dry-run reconciliation
- governed apply
- reconciliation evidence
- continuous healing

Canonical records:

- drift report
- reconciliation plan
- reconciliation action
- repair result

## Data model domains

AnyDB supports multiple data model domains through provider declarations.

| Domain | Meaning | Example providers |
|---|---|---|
| Relational | Tables, rows, constraints, SQL-style transactions | PostgreSQL, MySQL |
| Document | JSON-like records and nested documents | SurrealDB, MongoDB, CouchDB |
| Graph | Nodes, edges, traversals, relationships | Neo4j, SurrealDB, JanusGraph |
| Vector | Embeddings and similarity search | pgvector, Qdrant, Milvus |
| Time-series | Ordered metrics and temporal measurements | TimescaleDB, InfluxDB, Prometheus |
| Event | Append-only streams and replayable logs | Kafka, Redpanda, Pulsar, EventStoreDB |
| Key-value | Direct key lookup and cache-like access | Redis, FoundationDB, DynamoDB |
| Object | Large binary or structured artifacts | S3, MinIO, RustFS |
| Search | Full-text and faceted search | OpenSearch, Solr, Elasticsearch |
| External service | API-backed systems treated as governed state | SaaS APIs, ticketing systems, HRMS, CRM |

## Platform domains

### Query Domain

Defines read access across providers without pretending every backend has identical query semantics.

Responsibilities:

- query capability discovery
- query planning metadata
- filter support
- projection support
- pagination
- semantic search support
- provider limitation reporting

### Analytics Domain

Defines governed analytical access, data readiness, lineage, and derived views.

Responsibilities:

- data readiness checks
- lineage
- aggregates
- derived datasets
- feature datasets
- metrics
- analytical evidence

### Agent Domain

Defines agent state as governed operational data.

Responsibilities:

- agent identity
- agent memory references
- tool calls
- objectives
- decisions
- outcomes
- evaluations
- trust and kill-switch state

### Operations Domain

Defines infrastructure and runtime state that can be observed and reconciled.

Responsibilities:

- deployments
- health
- incidents
- runtime configuration
- secrets references
- rollouts
- rollback state
- operator actions

### Provider Domain

Defines how backends declare capability, limits, consistency, and conformance.

Responsibilities:

- provider capability declaration
- adapter metadata
- conformance profile
- consistency declaration
- endpoint metadata
- limits and retention

### Marketplace Domain

Defines how providers, adapters, schemas, skills, and domain packs are distributed.

Responsibilities:

- package identity
- publisher identity
- license
- certification
- domain pack compatibility
- installation metadata

## Domain pack

A domain pack is a portable package of schemas, policies, examples, tests, and provider mappings for one domain.

```text
anydb-domain-pack/
  domain.json
  schemas/
  policies/
  examples/
  conformance/
  mappings/
  README.md
```

## Domain maturity levels

| Level | Meaning |
|---|---|
| Defined | Domain is described and has canonical terms |
| Modeled | Domain has schemas and examples |
| Governed | Domain has policy, evidence, and audit contracts |
| Reconciled | Domain supports drift and repair contracts |
| Certified | Domain has executable conformance tests |

## Minimal domain declaration

```json
{
  "schemaVersion": "anydb-domain-v0.1",
  "domain": "agent",
  "displayName": "Agent Domain",
  "type": "platform",
  "maturity": "defined",
  "records": ["agent", "objective", "toolCall", "decision", "outcome", "evaluation"],
  "requiredCapabilities": ["canonicalIdentity", "stateTransitions", "auditLog", "provenance"],
  "optionalCapabilities": ["policyDecisionRecords", "evidence", "assertions", "reconciliation"]
}
```

## Initial AnyDB domain set

The initial AnyDB domain set is:

1. identity
2. policy
3. state
4. event
5. evidence
6. trust
7. reconciliation
8. data-model
9. query
10. analytics
11. agent
12. operations
13. provider
14. marketplace

## Status

This document defines the initial AnyDB domain model. The next step is to add domain schemas and domain pack examples.
