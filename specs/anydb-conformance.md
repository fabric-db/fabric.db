# AnyDB Conformance

**Status:** Draft v0.1

AnyDB conformance defines the minimum behavior a provider or adapter must prove before it can claim support for a given AnyDB profile.

Conformance is capability-based. A provider may support one model deeply and another model partially, but it must declare that difference clearly.

## Principles

- Claims must be testable.
- Unsupported capabilities must be explicit.
- Governance context must not be optional for governed transitions.
- Providers must fail closed when policy or identity context is missing.
- Evidence must be durable enough for audit and replay within the provider's declared limits.

## Profiles

### AnyDB Core v0.1

The Core profile proves that a provider can participate in the governed Fabric.

Required capabilities:

- `canonicalIdentity`
- `stateTransitions`
- `auditLog`
- `provenance`

Required tests:

1. Provider publishes a valid `anydb-provider-v0.1` declaration.
2. Provider rejects a governed write without tenant context.
3. Provider rejects a governed write without subject context.
4. Provider records a state transition for a successful write.
5. Provider links the transition to command, subject, resource, and timestamp.
6. Provider records provenance for the resulting state.
7. Provider exposes audit records for the transition.
8. Provider returns a machine-readable error for unsupported capabilities.

### AnyDB Event v0.1

The Event profile proves that a provider can emit durable change events.

Required capabilities:

- all AnyDB Core capabilities
- `changeEvents`
- `eventOrdering`
- `idempotency`
- `replay`

Required tests:

1. Provider emits an event for a successful state transition.
2. Event includes transition, subject, tenant, provider, and resource references.
3. Event ordering metadata is present.
4. Reusing an idempotency key returns the original result or a deterministic conflict.
5. Replay returns events within the provider's declared retention limits.
6. Replay preserves event identity and ordering metadata.

### AnyDB Trust v0.1

The Trust profile proves that a provider can preserve decisions and evidence for accountable operation.

Required capabilities:

- all AnyDB Event capabilities
- `policyDecisionRecords`
- `recordAuthorization`
- `evidence`
- `assertions`

Required tests:

1. Provider stores the policy decision record for each governed transition.
2. Provider links decisions to commands and transitions.
3. Provider records approval references when approvals are required.
4. Provider stores evidence references for resulting state.
5. Provider supports assertions over state, evidence, or transitions.
6. Provider can distinguish verified, disputed, expired, and revoked assertions.

### AnyDB Reconciled v0.1

The Reconciled profile proves that a provider can participate in deterministic control loops.

Required capabilities:

- all AnyDB Trust capabilities
- `driftDetection`
- `reconciliation`

Required tests:

1. Provider records desired state and observed state separately.
2. Provider reports drift when observed state differs from desired state.
3. Provider emits reconciliation recommendations or actions.
4. Reconciliation actions carry command and decision context.
5. Reconciliation results are recorded as state transitions.
6. Provider supports dry-run reconciliation when declared.
7. Provider prevents reconciliation when policy denies the action.

## Test fixture structure

Conformance fixtures should live under `examples/conformance/`.

```text
examples/conformance/
  providers/
    surrealdb-provider.json
    postgres-provider.json
  core/
    command-valid.json
    command-missing-subject.json
    transition-valid.json
  event/
    event-valid.json
    replay-result.json
  trust/
    decision-allow.json
    evidence-valid.json
    assertion-valid.json
  reconciled/
    desired-state.json
    observed-state.json
    drift-report.json
    reconciliation-action.json
```

## Certification language

Allowed language:

- "Conforms to AnyDB Core v0.1"
- "Conforms to AnyDB Event v0.1"
- "Conforms to AnyDB Trust v0.1"
- "Conforms to AnyDB Reconciled v0.1"

Avoid vague claims such as:

- "AnyDB compatible"
- "fully universal"
- "supports every database"
- "drop-in replacement for all backends"

## Conformance report

A conformance report should include:

- provider name and version
- adapter name and version, if different
- tested profile
- supported data models
- declared capabilities
- test runner version
- test result summary
- failing tests
- known limitations
- timestamp
- signer or issuer

## Status

This document defines the initial AnyDB conformance model. The next step is to add schemas and executable conformance tests.
