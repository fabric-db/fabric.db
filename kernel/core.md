# Kernel Core Contract

fabric.db kernel core defines the smallest stable set of governed state primitives.

## Contract

The kernel accepts only typed state transitions.

Every transition must include:

- actor
- action
- subject
- policy result
- event record
- timestamp
- provenance reference

## Kernel primitive tables

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
- reconciliation

## Boundary rule

No application-specific workflow belongs inside the kernel.

Workflows, apps, agents, tools, and surfaces integrate through contracts and events.
