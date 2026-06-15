# AnyDB Conformance Fixtures

This directory contains example records used to validate AnyDB conformance profiles.

The fixtures are intentionally small. They define the minimum evidence needed to test whether a provider can participate in the governed Fabric.

## Structure

```text
examples/conformance/
  manifest.json     Fixture manifest and profile map
  providers/        Provider capability declarations
  core/             Core command and transition records
  event/            Event profile records
  trust/            Policy, evidence, and assertion records
  reconciled/       Desired state, observed state, drift, and repair records
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

## Validation

Run the local validator from the repository root:

```bash
python tools/validate_anydb.py
```

The validator checks:

- manifest structure
- JSON syntax for every listed fixture
- provider fixture required fields and required capabilities
- domain fixture required fields
- profile names and declared fixture paths

The same validation runs in GitHub Actions through `.github/workflows/validate-anydb.yml`.

## Status

Draft fixtures for AnyDB v0.1. The current validator is intentionally dependency-free; JSON Schema validation and profile-specific behavioral tests should be added next.
