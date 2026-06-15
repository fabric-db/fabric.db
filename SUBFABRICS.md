# Subfabric Hierarchy

The fabric can be broken into smaller governed units.

The rule is simple:

```text
Only split when the smaller unit still preserves accountability.
```

If a unit cannot identify actor, action, state, rule, evidence, and result, it is too small to be a fabric unit.

## Hierarchy

```text
bitfabric
    ↓
cellfabric
    ↓
nanofabric
    ↓
microfabric
    ↓
fabric
    ↓
landscape
    ↓
horizon
```

## bitfabric

A bitfabric is the smallest governed fact.

It answers:

```text
What is true?
Who asserted it?
When was it asserted?
Where did it come from?
```

Required fields:

- id
- value
- type
- source
- asserted_by
- timestamp

A bitfabric is not an action. It is an accountable fact.

## cellfabric

A cellfabric is the smallest governed state cell.

It answers:

```text
What state exists at this boundary?
Who owns it?
What rule applies?
```

Required fields:

- id
- subject
- state
- owner
- policy_ref
- timestamp

A cellfabric is state, not workflow.

## nanofabric

A nanofabric is the smallest governed action cell.

It answers:

```text
Who acted?
What changed?
Why did it change?
Under which rule?
With what evidence?
With what outcome?
```

A nanofabric contains:

- actor
- action
- subject
- state_before
- state_after
- policy_result
- event_type
- provenance
- timestamp

## microfabric

A microfabric is the smallest deployable governed kernel.

It contains enough kernel capability to run locally:

- identity
- state
- events
- policy
- decisions
- provenance
- reconciliation
- conformance

## fabric

A fabric is a federation of microfabrics.

It coordinates trust, conformance, reconciliation, and interoperability across bounded deployments.

## landscape

A landscape is an observable collection of fabrics across domains.

It is not necessarily controlled by one authority.
It is a map of known fabrics and their relationships.

## horizon

A horizon is the boundary of known, trusted, or observable fabric space.

Beyond the horizon, assumptions must be treated as unknown until discovered, verified, or reconciled.

## Core principle

Do not make the unit smaller than accountability.

The smallest valid unit is not a byte.
It is a governed fact.
