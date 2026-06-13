# OS Native Kernel Core.

Kernel Core is the Box.

The Box is the smallest building block of Fabric.

FabricDB is the OS-native database for boxes, nodes, agreements, tuplets, streams, state, and the Fabric Loop.

## Boundary.

```text
Kernel Core.
  Box.

OS Native DB.
  FabricDB runtime storage and index surface.

Chromium Headless.
  OS-native headless surface profile.
```

## Kernel Core.

The Kernel Core owns.

- Box identity.
- Box index.
- Box boundary.
- Box state.
- Box agreement.
- Box policy.
- Box streams.
- Box conformance.
- Box reconciliation.

The Kernel Core must remain small, stable, and policy-bound.

## OS Native DB.

The OS-native database owns.

- local durable state.
- index resolution.
- box registry.
- node registry.
- agreement registry.
- tuplet registry.
- stream journal.
- replay window.
- conformance records.

The OS-native database may use replaceable storage profiles.

Examples.

- SQLite.
- dqlite.
- SurrealDB.
- PostgreSQL.
- IndexedDB for browser-local profile.

No storage profile defines the core.

## Chromium Headless.

Chromium Headless is a headless OS-native surface profile.

It may provide.

- headless rendering.
- canvas execution.
- Fabric.js surface execution.
- browser automation.
- local UI testing.
- visual graph export.
- screenshot and PDF export.
- offline operator surface.

Chromium Headless does not define the core.

## Stack.

```text
Hardware.
OS Kernel.
OS Native DB.
Kernel Core Box.
Headless Chromium Surface.
Fabric.js Canvas.
Next.js / UI Shell optional.
NestJS / API Shell optional.
```

## Rule.

```text
Kernel Core is Box.
OS Native DB records Box.
Chromium Headless renders and operates Box without becoming Box.
```
