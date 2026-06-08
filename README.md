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

```text
Identity Layer
Contract Layer
Policy Layer
Command Layer
Decision Layer
Event + Evidence Layer
Assertion + Trust Layer
State + Reconciliation Layer
```

Together, these form the database fabric for governed agents.

## Repository structure

```text
specs/      Human-readable specifications
schemas/    JSON Schemas for canonical records
docs/       Publishing and adoption documents
examples/   Example records and flows
```

## Published specifications

- [Fabric DB Core](specs/fabric-db.md)
- [Fabric Assertions](specs/fabric-assertions.md)
- [Fabric State](specs/fabric-state.md)
- [Fabric Reconciliation](specs/fabric-reconciliation.md)
- [Fabric Trust Model](specs/fabric-trust-model.md)
- [Fabric Conformance](specs/fabric-conformance.md)

## Container

The canonical image path is:

```text
ghcr.io/fabric-db/fabric.db
```

Run locally:

```bash
docker run --rm -p 8000:8000 ghcr.io/fabric-db/fabric.db:latest
```

## Status

Initial public specification baseline.

## License

Apache-2.0
