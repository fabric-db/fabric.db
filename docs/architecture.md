# fabric.db Architecture

fabric.db is organized as a governed state fabric.

## Layers

Identity Layer
Policy Layer
State Layer
Event Layer
Decision Layer
Reconciliation Layer

## Identity Layer

Defines actors and subjects.

Examples:

- user
- agent
- organization
- tenant
- service account
- tool identity

## Policy Layer

Defines permissions, constraints, approvals, and obligations.

## State Layer

Stores current state.

## Event Layer

Stores append-only state changes.

## Decision Layer

Stores why an action happened.

## Reconciliation Layer

Compares desired state and observed state.
