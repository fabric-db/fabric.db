# Microbox

A microbox is the smallest deployable accountable box.

It is a bounded runtime unit that contains enough identity, state, policy, eventing, provenance, and reconciliation capability to operate independently and remain governable.

## Definition

A microbox is a deployable box with a local kernel core.

It can receive input, apply policy, change state, emit events, preserve provenance, expose audit evidence, and reconcile drift.

```text
microbox = accountable boundary + minimal governed kernel
```

## Difference from microfabric

A microfabric is the governed kernel capability.

A microbox is the deployable accountable boundary that contains that capability.

```text
microfabric = capability
microbox    = deployable responsibility boundary
```

A microfabric can run inside a microbox.
A microbox can host one or more fabric capabilities, but it must keep responsibility bounded.

## Purpose

A microbox exists to make a small unit independently governable.

It is useful for:

- edge deployments
- tenant-local state
- workspace-local governance
- isolated agent runtimes
- air-gapped systems
- local tool execution
- embedded product modules
- regulated data zones

## Minimum components

A valid microbox must include:

- box identity
- boundary manifest
- state store
- event log
- policy gate
- provenance trail
- input port
- output port
- audit surface

## Governed microbox components

A fully governed microbox includes:

- box identity
- owner identity
- tenant identity
- boundary manifest
- capability manifest
- schema manifest
- policy manifest
- state store
- event log
- approval records
- decision records
- provenance records
- desired state
- observed state
- drift records
- reconciliation records
- conformance report
- audit surface

## Microbox lifecycle

```text
created
configured
sealed
active
degraded
reconciling
suspended
retired
archived
```

## Microbox edge

Every crossing at the microbox edge must be:

- typed
- validated
- attributed
- policy checked
- recorded
- replayable
- reconcilable

## Relationship to hierarchy

```text
bitfabric   = governed fact
cellfabric  = governed state
nanofabric  = governed action
microfabric = governed kernel capability
microbox    = deployable accountable kernel boundary
fabric      = federation of microboxes
landscape   = observable collection of fabrics
horizon     = boundary of known fabric space
```

## Implementation forms

A microbox may be implemented as:

- container
- VM
- process group
- k8s pod
- tenant namespace
- device runtime
- local database namespace
- air-gapped deployment unit

The implementation form can change.
The accountable boundary is the microbox.

## Principle

A microbox is the smallest thing you can deploy, govern, audit, and reconcile as one unit of responsibility.
