# Protocol First

fabric.db is protocol-first.

The core must define protocols before profiles, products, vendors, runtimes, databases, or operating systems.

## Rule

```text
Protocol first.
Contract second.
Profile third.
Implementation fourth.
```

## Meaning

A protocol defines how fabric units communicate, prove, govern, and reconcile.

A contract binds that protocol to a required shape.

A profile explains how a real stack satisfies the contract.

An implementation runs the profile.

## Core order

```text
Protocol
↓
Contract
↓
Profile
↓
Implementation
↓
Deployment
```

## Core protocols

fabric.db core starts with these protocols:

- identity protocol
- state protocol
- event protocol
- policy protocol
- approval protocol
- decision protocol
- provenance protocol
- reconciliation protocol
- conformance protocol
- federation protocol

## Non-negotiable rule

No profile may define the protocol.

No implementation may redefine the contract.

No vendor may own the core behavior.

## Protocol boundary

A protocol must specify:

- actors
- messages
- required fields
- state transitions
- validation rules
- evidence requirements
- failure behavior
- conformance checks

## Profile boundary

A profile may specify:

- operating system
- database
- runtime
- packaging
- deployment method
- management surface
- observability surface

Profiles are replaceable.
Protocols are stable.

## Principle

If two boxes obey the same protocol, they can cooperate even if they use different implementations.
