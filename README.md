# fabric.db

**The governed state fabric for agentic systems.**

fabric.db defines the canonical database + runtime + governance layer for autonomous, multi-agent, event-driven platforms. It treats state, identity, policy, events, decisions, provenance, audit, assertions, and reconciliation as first-class operational data.

---

# 🧠 Core Vision

Agents should not operate in invisible memory.
They should operate on governed state.

Fabric ensures every action is:

- attributable
- policy-governed
- trust-scored
- event-sourced
- replayable
- reconcilable

---

# 🔁 Trust Chain

```text
Command
  ↓
Decision
  ↓
Event
  ↓
Evidence
  ↓
Assertion
  ↓
State
  ↓
Reconciliation
  ↓
Trusted State
```

---

# 📦 What fabric.db models

- agents
- users
- tenants
- workspaces
- tools
- credentials
- policies
- commands
- events
- decisions
- actions
- evidence
- assertions
- provenance
- state
- reconciliation
- drift

---

# 🧱 Architecture Layers

Fabric is structured as:

```text
Identity Layer
  ↓
Contract Layer
  ↓
Policy Layer (UGD)
  ↓
Command Layer
  ↓
Decision Layer
  ↓
Event + Evidence Layer
  ↓
Assertion + Trust Layer
  ↓
State + Reconciliation Layer
```

---

# 🌐 AnyDB (Governed Data Fabric)

AnyDB is the database-independent capability layer of fabric.db.

It connects:

- relational
- document
- graph
- vector
- event
- key-value
- time-series

All under a single governance model:

> identity + policy + provenance + state

---

# 🦀 Rust Implementation (New)

Fabric is now implemented as a Rust workspace:

```
crates/
├── fabric-core              # event-sourced state engine
├── fabric-control-plane     # policy + trust + schema governance
├── fabric-runtime           # API + execution runtime (WIP)
├── fabric-sdk               # developer SDK (WIP)
```

---

# ⚙️ Fabric Core

- event-sourced state machine
- trust-aware execution engine
- deterministic replay system

All state is derived from events.

---

# 🧭 Control Plane

The governance brain of Fabric:

- UGD policy engine
- trust graph computation
- schema registry (AnyDB governance)
- federation orchestration

Ensures:

> no execution without explicit governance approval

---

# 🌐 Runtime Plane

Execution layer (WIP):

- edge nodes
- PII gateway
- federation router
- fabric core engine
- event store

---

# 🧰 SDK Layer

Developer-facing API:

- `/fabric/execute`
- identity-aware requests
- trust-scored execution
- policy-gated responses

---

# 🔐 System Properties

Fabric guarantees:

- deterministic execution
- deny-by-default governance
- full auditability
- trust-aware routing
- replayable state
- multi-org federation safety

---

# 🌍 Deployment Model

- multi-region control plane
- isolated tenant data planes
- federated trust graph
- global schema governance

---

# ⚙️ Execution Model

```text
PII Filter → UGD Policy → Trust Graph → AnyDB Mapping → Federation Router → Fabric Core → Reconciliation
```

---

# 🧪 Test System

fabric.db includes an end-to-end acceptance test system that exercises the production Docker image and canonical SurrealDB schema.

Run the database acceptance suite:

```bash
make test
```

Keep the tested database running for inspection:

```bash
make test-db-keep
```

Run Rust workspace tests separately:

```bash
make test-rust
```

The acceptance system validates:

- production image build and database health
- schema and helper-function loading
- tenant, actor, agent, tool, policy, approval and decision records
- event and provenance traceability
- desired state, observed state and drift
- governed record relationships
- database persistence across restart

Test assets live in:

```text
tests/run.sh
tests/acceptance.surql
TESTING.md
.github/workflows/ci.yml
```

CI runs the database acceptance suite automatically on pushes to `main`, pull requests, and manual workflow dispatches.

---

# 🚀 Status

### Implemented
- Fabric Core (Rust)
- Control Plane (Rust)
- Whitepaper (formal spec)
- Cloud architecture (multi-region model)
- Database acceptance test system
- Automated CI validation

### In Progress
- Runtime integration layer
- SDK completion
- Event store backend
- Full Rust workspace conformance

---

# 🧠 Final Definition

> Fabric is a distributed governance operating system for multi-organization state systems.

It transforms computation into:

> controlled, attributable, trust-aware state transitions.

---

# 📜 License
Apache-2.0