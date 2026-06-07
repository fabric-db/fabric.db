# Next.js Boundary.

Next.js is the web application shell.

Next.js is not the FabricDB core.

## Role.

```text
FabricDB core.
  Defines the model.

TypeScript.
  Implements type safety and headless execution.

NestJS.
  Provides backend service runtime when needed.

Next.js.
  Provides web application shell.

Fabric.js.
  Provides visual canvas surface.
```

## Next.js owns.

- routes.
- pages.
- layouts.
- server actions.
- API routes when used.
- authentication surfaces.
- tenant console.
- onboarding surfaces.
- dashboard surfaces.
- Fabric.js canvas embedding.

## Next.js must not own.

- box meaning.
- agreement meaning.
- policy meaning.
- conformance meaning.
- stable state meaning.
- Fabric Loop truth.

## Rule.

```text
Next.js presents.
TypeScript checks.
Fabric.js renders.
FabricDB records.
Box remains core.
```
