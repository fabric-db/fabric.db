# fabric.db Kernel Core

fabric.db is the kernel core for governed agentic state.

It does not own the application surface.
It does not own the agent UI.
It does not own orchestration.
It owns the stable primitives that every governed agentic system must rely on.

## Kernel responsibility

The kernel core owns:

- identity-bound state
- typed events
- policy-bound actions
- decision records
- provenance records
- desired state
- observed state
- drift records
- reconciliation records
- conformance contracts

## Non-goals

The kernel core does not own:

- frontend UI
- agent personalities
- model routing
- business workflows
- chat surfaces
- vendor-specific integrations
- application-specific tools

Those live outside the kernel and bind to it through contracts.

## Kernel invariants

1. Every actor has identity.
2. Every action emits an event.
3. Every event is attributable.
4. Every governed action has a policy result.
5. Every decision is recorded.
6. Every output has provenance.
7. Every desired state can be compared with observed state.
8. Every drift can be reconciled or explicitly waived.
9. Every schema change is versioned.
10. The kernel must remain small, stable, and auditable.

## Kernel boundary

```text
External systems
    ↓
Adapters / operators / agents
    ↓
fabric.db kernel core
    ↓
State, events, policy, decisions, provenance, reconciliation
```

## Core primitive set

```text
Tenant
Actor
Agent
Tool
Policy
Approval
Event
Decision
Provenance
DesiredState
ObservedState
Drift
Reconciliation
```

## Principle

The kernel does not chase every use case.
It holds the ground so every use case can remain governed.
