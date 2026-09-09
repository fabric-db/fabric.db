# fabric.db

**The governed state fabric for agentic systems.**

fabric.db is the canonical governed state layer for autonomous, multi-agent, and event-driven systems. It makes identity, policy, decisions, events, provenance, desired state, observed state, drift, and reconciliation explicit operational data instead of leaving them hidden inside application memory.

## Core idea

Agents should not operate on invisible state.
They should operate on governed, attributable, replayable state.

fabric.db is designed so every meaningful transition can be:

- attributed to an actor or agent
- checked against policy
- recorded as an event
- linked to provenance
- compared against desired state
- inspected for drift
- replayed and reconciled

## Trust chain

```text
Command
  ↓
Decision
  ↓
Event
  ↓
Evidence / Provenance
  ↓
Assertion
  ↓
State
  ↓
Reconciliation
  ↓
Trusted State
```

## Canonical model

The current SurrealDB schema includes first-class records for:

- tenant
- actor
- agent
- tool
- policy
- approval
- event
- decision
- provenance
- desired_state
- observed_state
- drift

The broader Fabric model also covers commands, evidence, assertions, reconciliation, credentials, workspaces, and governed execution semantics.

## Architecture

```text
Identity
  ↓
Contract
  ↓
Policy
  ↓
Decision
  ↓
Event + Provenance
  ↓
Desired / Observed State
  ↓
Drift Detection
  ↓
Reconciliation
  ↓
Trusted State
```

## AnyDB

AnyDB is the database-independent capability layer of fabric.db.

Its purpose is to put multiple data models under the same governance contract:

```text
relational
+ document
+ graph
+ vector
+ event
+ key-value
+ time-series
        ↓
identity + policy + provenance + state
```

The repository currently includes a SurrealDB implementation and an `anydb-adapter-surrealdb` crate path alongside the core Fabric crates.

## Repository structure

```text
crates/
├── anydb-adapter-surrealdb
├── fabric-core
├── fabric-control-plane
└── fabric-runtime

surrealdb/
├── schema.surql
└── functions.surql

schema/
└── event.schema.json

tests/
├── run.sh
└── acceptance.surql
```

The Rust workspace is still being completed. Database acceptance testing is intentionally runnable independently from full Rust workspace conformance.

## Run fabric.db

Build the production image:

```bash
docker build -t fabric-db .
```

Run it locally:

```bash
docker run --rm \
  --name fabric-db \
  -p 8000:8000 \
  -v fabric-db-data:/data \
  fabric-db
```

Health check:

```bash
curl http://localhost:8000/health
```

The container uses SurrealDB and persists data under `/data`.

## Test system

fabric.db includes an end-to-end acceptance test system that tests the production Docker image and canonical schema.

Run the database acceptance suite:

```bash
make test
```

Keep the tested database alive for inspection:

```bash
make test-db-keep
```

Run Rust workspace tests separately:

```bash
make test-rust
```

The acceptance suite validates:

- production image build
- SurrealDB health
- canonical schema loading
- helper functions
- tenant, actor, agent, tool, policy, approval and decision records
- event and provenance traceability
- desired and observed state
- drift representation
- governed record relationships
- persistence across database restart

See [`TESTING.md`](TESTING.md) for the complete test workflow.

## Execution model

```text
Identity
  ↓
Policy
  ↓
Decision
  ↓
Event
  ↓
Provenance
  ↓
State
  ↓
Drift Detection
  ↓
Reconciliation
```

The intended higher-level runtime path is:

```text
PII Filter
  → Policy
  → Trust
  → AnyDB Mapping
  → Federation
  → Fabric Core
  → Reconciliation
```

## System properties

fabric.db is being built around these properties:

- deny-by-default governance
- attributable execution
- deterministic and replayable state transitions
- provenance-aware state
- trust-aware routing
- explicit desired vs observed state
- drift detection and reconciliation
- multi-tenant and federated operation

## Development status

### Implemented

- canonical SurrealDB schema
- helper functions
- Fabric Core codebase
- Fabric Control Plane codebase
- Fabric Runtime codebase
- AnyDB SurrealDB adapter path
- production Docker image definition
- database acceptance test system
- automated CI validation
- architecture and governance documentation

### In progress

- complete Rust workspace conformance
- runtime integration layer
- developer SDK
- event-store backend abstraction
- full reconciliation engine
- multi-backend AnyDB conformance

## Testing in CI

GitHub Actions runs repository validation and the database acceptance suite on pushes to `main`, pull requests, and manual workflow dispatches.

The local and CI entry point is intentionally the same:

```bash
make test
```

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md) and [`GOVERNANCE.md`](GOVERNANCE.md).

## License

Licensed under the **Apache License, Version 2.0**.

See [`LICENSE`](LICENSE) for the full license text.

---

> **fabric.db turns autonomous computation into governed, attributable, inspectable state transitions.**
