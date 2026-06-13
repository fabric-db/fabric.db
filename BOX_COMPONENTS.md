# Box Components

A box is an accountable boundary.

Its components are the minimum parts required to make responsibility computable.

## Component map

```text
Box
├── Identity
├── Boundary
├── State Store
├── Event Log
├── Policy Gate
├── Decision Record
├── Provenance Trail
├── Input Port
├── Output Port
├── Drift Detector
├── Reconciler
├── Conformance Surface
└── Audit Surface
```

## 1. Identity

Defines who or what the box is.

Required:

- box_id
- owner
- tenant
- actor identity
- trust domain
- lifecycle status

The box must be identifiable before it can be trusted.

## 2. Boundary

Defines what is inside and what is outside.

Required:

- scope
- allowed inputs
- allowed outputs
- authority boundary
- isolation mode
- exposure surface

The boundary prevents responsibility from leaking.

## 3. State Store

Holds current state.

Required:

- subject
- state
- version
- owner
- timestamp
- schema reference

State must be typed and versioned.

## 4. Event Log

Records what happened.

Required:

- event_id
- actor
- action
- subject
- state reference
- timestamp
- correlation id

Events are append-only.

## 5. Policy Gate

Checks whether an action is allowed.

Required:

- policy id
- subject
- action
- resource
- effect
- reason
- approval requirement

No governed action crosses the box edge without policy evaluation.

## 6. Decision Record

Records why an action was selected.

Required:

- objective
- context
- constraints
- options
- selected option
- policy result
- approval result
- outcome

A decision without a record is not governed.

## 7. Provenance Trail

Records where data, action, and output came from.

Required:

- source
- source type
- actor
- tool
- model
- input hash
- output hash
- timestamp

Provenance makes replay and audit possible.

## 8. Input Port

Receives external signals.

Required:

- input type
- source
- validation result
- schema reference
- policy result

Inputs must be validated before becoming state.

## 9. Output Port

Emits typed outputs.

Required:

- output type
- destination
- payload reference
- policy result
- provenance reference

Outputs must be governed at the edge.

## 10. Drift Detector

Compares desired state and observed state.

Required:

- desired state
- observed state
- diff
- severity
- status

Drift is not failure. Unhandled drift is failure.

## 11. Reconciler

Records reconciliation intent and result.

Required:

- drift reference
- remediation plan
- approval status
- execution status
- final state

The reconciler records the correction path. External operators may execute remediation.

## 12. Conformance Surface

Exposes whether the box follows the required contracts.

Required:

- schema conformance
- policy conformance
- event conformance
- provenance conformance
- reconciliation conformance

Conformance makes the box interoperable.

## 13. Audit Surface

Exposes evidence for inspection.

Required:

- events
- decisions
- approvals
- provenance
- policy results
- reconciliation history

Audit is the readable face of accountability.

## Minimal box

The minimum valid box has:

```text
Identity
Boundary
State Store
Event Log
Policy Gate
Provenance Trail
```

## Full governed box

A full governed box has:

```text
Identity
Boundary
State Store
Event Log
Policy Gate
Decision Record
Provenance Trail
Input Port
Output Port
Drift Detector
Reconciler
Conformance Surface
Audit Surface
```

## Principle

A box is not complete because it runs.

A box is complete when it can explain what happened inside it, what crossed its edge, and who is responsible.
