# nanofabric

A nanofabric is the smallest embeddable fabric cell.

It is not a full deployable fabric instance. It is the minimal governed state unit that can live inside a process, agent, tool, device, workflow, or isolated execution context.

## Definition

A nanofabric is a tiny local fabric cell with enough structure to record:

- identity
- state
- event
- policy result
- decision context
- provenance
- reconciliation intent

It is the smallest unit that can say:

```text
who acted
what changed
why it changed
under which rule
with what evidence
with what outcome
```

## Purpose

A nanofabric exists to make even the smallest action accountable.

It allows local execution to remain governable before the action reaches a microfabric, fabric, or wider landscape.

## Boundary

A nanofabric owns action-local truth.

It does not own tenant truth.
It does not own workspace truth.
It does not own global truth.

It records a governed state cell and hands it upward for reconciliation.

## Relationship

```text
fabric.db        = kernel specification
nanofabric       = smallest embeddable governed state cell
microfabric      = smallest deployable governed kernel instance
fabric           = cooperating microfabrics
fabric landscape = many fabrics across domains
```

## Required fields

A nanofabric record must contain:

- id
- actor
- action
- subject
- state_before
- state_after
- policy_result
- event_type
- provenance
- timestamp

## Non-goals

A nanofabric does not perform:

- global orchestration
- full policy administration
- tenant lifecycle management
- multi-agent routing
- long-term storage authority
- cross-domain reconciliation

Those belong to larger fabric units.

## Principle

A nanofabric is accountability at the smallest possible boundary.

No action is too small to be governed.
