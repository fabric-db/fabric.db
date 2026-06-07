# Language Boundaries.

TypeScript is the BE language.

Fabric.js is the UI language.

FabricDB core remains protocol-first and model-first.

## Boundary.

```text
TypeScript = backend and application language.
Fabric.js = UI and visual building language.
FabricDB = structured multimodel graph database model.
```

## TypeScript role.

TypeScript owns backend and application logic.

It may implement:

- APIs.
- validation.
- indexing.
- storage adapters.
- policy integration.
- stream orchestration.
- Fabric Loop execution.
- profile bindings.

## Fabric.js role.

Fabric.js owns the UI building surface.

It may render and edit:

- boxes.
- nodes.
- agreements.
- tuplets.
- streams.
- state.
- fabric loops.
- fabric graphs.

## Core rule.

Fabric.js does not define the core.

TypeScript does not define the core.

The core defines the model.

TypeScript implements it.

Fabric.js renders and builds it visually.

## No extra language.

No BBL.

No UBL.

No new file extension.

Statements may use a full stop as the terminator in documentation.

## Canonical stack.

```text
FabricDB model.
TypeScript implementation.
Fabric.js UI surface.
```
