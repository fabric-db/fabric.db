# AnyDB Adapter SDK

**Status:** Draft v0.1

The AnyDB Adapter SDK defines the required interface for connecting a database, search engine, event system, object store, or external API to the AnyDB governance fabric.

An adapter is not just a driver. It is the governed boundary where provider capabilities, identity, policy, state transitions, evidence, events, and reconciliation become enforceable.

## Goals

- Give every provider a consistent implementation contract.
- Make capability declarations testable.
- Preserve provider-specific behavior without hiding important limits.
- Support incremental adoption from Core to Reconciled conformance.
- Give CI and certification tools a stable target.

## Adapter lifecycle

```text
Discover
  -> Initialize
  -> Declare Capabilities
  -> Validate Configuration
  -> Connect
  -> Execute Governed Operation
  -> Record Transition
  -> Emit Event
  -> Produce Evidence
  -> Reconcile
  -> Report Conformance
```

## Required adapter manifest

Every adapter must publish an adapter manifest.

```json
{
  "schemaVersion": "anydb-adapter-v0.1",
  "adapter": "surrealdb-anydb-adapter",
  "provider": "surrealdb",
  "version": "0.1.0",
  "language": "rust",
  "runtime": "native",
  "providerDeclaration": "examples/conformance/providers/surrealdb-provider.json",
  "conformance": "anydb-reconciled-v0.1",
  "entrypoints": {
    "library": "crates/anydb-adapter-surrealdb",
    "container": "ghcr.io/fabric-db/anydb-adapter-surrealdb"
  }
}
```

## Core interface

An AnyDB adapter should implement the following logical interface. Language-specific SDKs may expose this as traits, interfaces, abstract classes, or service contracts.

```text
Adapter
  discover() -> ProviderDeclaration
  initialize(config) -> AdapterHandle
  health() -> HealthReport
  capabilities() -> ProviderDeclaration
  validate(command) -> ValidationResult
  authorize(command, context) -> PolicyDecision
  execute(command, context) -> TransitionResult
  read(resourceRef, context) -> StateRecord
  write(command, context) -> TransitionResult
  query(query, context) -> QueryResult
  emit(transition, context) -> EventRecord
  evidence(transition, context) -> EvidenceRecord
  assert(record, context) -> AssertionRecord
  observe(resourceRef, context) -> ObservedState
  diff(desired, observed, context) -> DriftReport
  reconcile(action, context) -> ReconciliationResult
  conformance(profile) -> ConformanceReport
```

## Minimum Core methods

AnyDB Core adapters must implement:

- `discover`
- `initialize`
- `health`
- `capabilities`
- `validate`
- `authorize`
- `execute`
- `read`
- `write`
- `conformance`

## Event methods

AnyDB Event adapters must additionally implement:

- `emit`
- event ordering metadata
- idempotency handling
- replay cursor support

## Trust methods

AnyDB Trust adapters must additionally implement:

- `evidence`
- `assert`
- policy decision storage
- approval reference storage
- evidence retention metadata

## Reconciled methods

AnyDB Reconciled adapters must additionally implement:

- `observe`
- `diff`
- `reconcile`
- dry-run reconciliation
- repair transition recording

## Context object

Every governed adapter method must receive context.

```json
{
  "tenantId": "tenant_acme",
  "workspaceId": "workspace_ops",
  "subject": {
    "type": "agent",
    "id": "agent_repair_001"
  },
  "requestId": "req_01HX0000000000000000000000",
  "policyMode": "enforce",
  "traceId": "trace_01HX0000000000000000000000"
}
```

## Safety rules

- Missing tenant context must fail closed.
- Missing subject context must fail closed.
- Failed authorization must not mutate provider state.
- Dry-run reconciliation must not mutate provider state.
- Idempotency conflicts must be deterministic.
- Unsupported capabilities must return `CAPABILITY_UNSUPPORTED`.
- Provider limitations must be visible in the provider declaration.

## Adapter error codes

Adapters should use the AnyDB protocol error model and these standard codes:

- `CAPABILITY_UNSUPPORTED`
- `CONFIG_INVALID`
- `CONNECTION_FAILED`
- `POLICY_DENIED`
- `APPROVAL_REQUIRED`
- `SCHEMA_INVALID`
- `STATE_CONFLICT`
- `IDEMPOTENCY_CONFLICT`
- `PROVIDER_UNAVAILABLE`
- `EVIDENCE_MISSING`
- `RECONCILIATION_REQUIRED`

## Conformance hooks

An adapter should expose a deterministic conformance mode that can run against fixtures without production side effects.

Conformance mode must support:

- fixture loading
- dry-run operation
- deterministic IDs when configured
- deterministic timestamps when configured
- isolated test namespace or database
- clean teardown

## Initial SDK targets

Initial SDK targets should be:

1. Rust trait package for high-integrity providers
2. Go interface package for operators and controllers
3. TypeScript interface package for web and integration adapters
4. OCI adapter image contract for language-neutral execution

## Status

This is the initial AnyDB Adapter SDK contract. The next step is to add language-specific interfaces and a reference SurrealDB adapter skeleton.
