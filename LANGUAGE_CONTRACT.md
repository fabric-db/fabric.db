# Language Contract.

The platform holds the contract to provide a unified, interpretable Structured Instruction Set for accessing and operating boxes.

## Definition.

```text
Platform.
  Holds the language contract.

Structured Instruction Set.
  Provides unified, interpretable, structured instructions.

Box.
  Is the kernel core being accessed and operated.
```

## Purpose.

The Structured Instruction Set ensures that every surface can operate on boxes without redefining their meaning.

Surfaces may include.

- MQL.
- SQL.
- AgentQL.
- MultiScript.
- TypeScript.
- Node.js.
- Next.js.
- Fabric.js.
- API clients.
- policy engines.
- storage profiles.
- agent runtimes.

## Instruction classes.

The Structured Instruction Set must define instructions for.

- identify box.
- resolve box index.
- access box.
- read state.
- record state.
- create agreement.
- check policy.
- verify conformance.
- emit stream.
- receive stream.
- reconcile state.
- lock decision.
- replay event.
- audit evidence.

## Rules.

No surface may redefine Box meaning.

No surface may bypass policy.

No surface may bypass agreement.

No surface may bypass conformance.

No surface may mutate state without decision.

No instruction is valid without identity, scope, policy, time, and provenance.

## Conformance.

A language surface conforms when it preserves.

- Box meaning.
- Node meaning.
- Agreement meaning.
- Tuplet meaning.
- Policy meaning.
- State meaning.
- Stream meaning.
- Decision meaning.
- Conformance meaning.
- Fabric Loop meaning.

## Final statement.

```text
Platform holds the language contract.
The language contract provides the Structured Instruction Set.
The Structured Instruction Set operates boxes.
```
