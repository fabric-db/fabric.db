# fabric.db

**The governed state fabric for agentic systems.**

fabric.db defines the canonical database layer for autonomous, multi-agent, event-driven platforms. It treats state, identity, policy, events, decisions, provenance, audit, and reconciliation as first-class data.

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
- auditable
- reconcilable

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
- events
- decisions
- actions
- outcomes
- provenance
- reconciliation
- drift

## Architecture

fabric.db is designed around six layers:

```text
Identity Layer
Policy Layer
State Layer
Event Layer
Decision Layer
Reconciliation Layer
```

Together, these form the database fabric for governed agents.

## Container

The canonical image path is:

```text
ghcr.io/fabric-db/fabric.db
```

Run locally:

```bash
docker run --rm -p 8000:8000 ghcr.io/fabric-db/fabric.db:latest
```

## License

Apache-2.0
