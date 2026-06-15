# Box

A box is a bounded reality container.

It is the smallest complete boundary where identity, state, policy, events, decisions, provenance, and reconciliation can exist together without leaking responsibility.

## Definition

A box is a closed operational boundary that can:

- receive events
- emit events
- hold state
- apply policy
- record decisions
- preserve provenance
- detect drift
- reconcile state
- expose conformance

A box is not merely a container, VM, pod, process, database, or service.
Those are implementation forms.

A box is the accountable boundary.

## Purpose

A box exists to make responsibility explicit.

Inside the box, something can happen.
At the edge of the box, that happening must become visible, typed, governed, and reconcilable.

## Relationship to fabric units

```text
bitfabric   = governed fact
cellfabric  = governed state cell
nanofabric  = governed action cell
microfabric = deployable governed kernel
box         = accountable boundary around a fabric unit
fabric      = federation of boxes / microfabrics
landscape   = observable collection of fabrics
horizon     = boundary of known fabric space
```

A nanofabric can live inside a box.
A microfabric can be deployed as a box.
A fabric is formed when boxes cooperate through contracts.

## Box invariants

A valid box must have:

1. identity
2. boundary
3. state
4. input
5. output
6. policy
7. event log
8. provenance
9. drift detection
10. reconciliation path

If it cannot identify what entered, what changed, what left, and who is responsible, it is not a box.

## Box edge

The edge of the box is where governance becomes visible.

At the edge, every crossing must be:

- typed
- attributable
- policy-checked
- recorded
- replayable
- reconcilable

## Box is not isolation alone

A box can be isolated, but isolation is not enough.

A box must also be accountable.

## Implementation forms

A box may be implemented as:

- process
- container
- VM
- node
- tenant
- workspace
- device
- agent runtime
- database namespace
- air-gapped deployment

The implementation can change.
The accountable boundary remains the box.

## Principle

A box is where responsibility becomes computable.
