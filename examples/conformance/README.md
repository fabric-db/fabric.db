# AnyDB Conformance Fixtures

This directory contains example records used to validate AnyDB conformance profiles.

The fixtures are intentionally small. They define the minimum evidence needed to test whether a provider can participate in the governed Fabric.

## Structure

```text
examples/conformance/
  providers/       Provider capability declarations
  core/            Core command and transition records
  event/           Event profile records
  trust/           Policy, evidence, and assertion records
  reconciled/      Desired state, observed state, drift, and repair records
```

## Fixture flow

```text
command-valid.json
  -> transition-valid.json
  -> event-valid.json
  -> decision-allow.json
  -> evidence-valid.json
  -> assertion-valid.json
  -> desired-state.json
  -> observed-state.json
  -> drift-report.json
  -> reconciliation-action.json
```

## Provider examples

The provider fixtures show how different backends can join AnyDB without claiming identical behavior:

- SurrealDB: multi-model provider candidate
- PostgreSQL: relational provider candidate
- OpenSearch: search provider candidate

## Status

Draft fixtures for AnyDB v0.1. These are examples first; executable validation should be added next.
