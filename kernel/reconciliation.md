# Reconciliation

Reconciliation is the kernel mechanism that compares desired state and observed state.

## Inputs

- desired_state
- observed_state

## Outputs

- drift
- remediation recommendation
- reconciliation status

## States

- in_sync
- drift_detected
- reconciling
- reconciled
- waived
- failed

## Principle

The kernel records reconciliation.

External operators perform remediation.
