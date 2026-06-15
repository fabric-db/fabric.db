# fabric.db

**The governed state fabric for agentic systems.**

fabric.db defines the canonical database layer for autonomous, multi-agent, event-driven platforms. It treats state, identity, policy, events, decisions, provenance, audit, assertions, and reconciliation as first-class operational data.

Agents should not operate in invisible memory.  
They should operate on governed state.

## Why fabric.db exists

Agent systems fail when:

- state is fragmented
- actions are not attributable
- policy is external and disconnected
- memory is ungoverned
- events are not replayable
- decisions are not auditable
- evidence is missing
- trust assertions are not verifiable
- drift is not reconciled
- identity is weak
- tools are invoked without durable accountability

fabric.db exists to make agentic systems safe to operate in production.

## Core idea

Every agent action is a state transition.

Every state transition must be:

- typed
- governed
- attributable
- observable
- replayable
- evidenced
- auditable
- assertable
- reconcilable

## Trust chain

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

## What fabric.db models

fabric.db provides canonical models for:

- agents
- users
- tenants
- workspaces
- tools
- resources
- credentials
- policies
- approvals
- commands
- events
- decisions
- actions
- outcomes
- evidence
- assertions
- provenance
- state
- reconciliation
- drift

## Architecture

fabric.db is designed around eight layers:

Identity Layer → Contract Layer → Policy Layer → Command Layer → Decision Layer → Event + Evidence Layer → Assertion + Trust Layer → State + Reconciliation Layer

## Repository structure

- specs/
- schemas/
- docs/
- examples/
- tools/

## AnyDB (Governed Database Capability Layer)

AnyDB is the database-independent capability layer of fabric.db.

It defines how heterogeneous databases participate in a single governed state fabric.

### Positioning

- fabric.db = reference specification + implementation
- AnyDB = database-independent capability layer
- The Fabric = full governed state architecture
- AnyDB Protocol = interoperability contract

### Definition

AnyDB is a database-independent fabric that connects relational, document, graph, vector, time-series, event, key-value, and object data through one identity, policy, provenance, and state model.

### Ecosystem

- specs/anydb
- schemas/anydb
- examples/anydb
- validate_anydb.py
- CI conformance workflows

### Principle

A database becomes part of AnyDB when it can expose governed state transitions and produce verifiable evidence of changes.

## Container

ghcr.io/fabric-db/fabric.db

```bash
docker run --rm -p 8000:8000 ghcr.io/fabric-db/fabric.db:latest
```

## Status

Initial public specification baseline.

## License

Apache-2.0
