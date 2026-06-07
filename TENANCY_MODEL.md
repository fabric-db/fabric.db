# Tenancy Model.

FabricDB is multi-tenant by design.

Multi-tenancy is not an optional deployment mode.

It is part of the DBaaS contract.

## Principle.

```text
Every tenant has a bounded fabric.
Every tenant has isolated boxes.
Every tenant has policy-bound access.
Every tenant has auditable state.
```

## Tenant.

A tenant is an accountable commercial and governance boundary.

A tenant owns or is assigned.

- tenant identity.
- tenant namespace.
- tenant fabric.
- tenant box indexes.
- tenant agreements.
- tenant policies.
- tenant state.
- tenant streams.
- tenant audit records.
- tenant replay boundary.
- tenant conformance reports.

## Tenant isolation.

Tenant isolation must apply to.

- identity.
- namespace.
- indexes.
- boxes.
- nodes.
- agreements.
- tuplets.
- policies.
- state.
- streams.
- replay windows.
- audit trails.
- backups.
- billing records.

## Control plane.

A shared control plane may operate multiple tenants.

The control plane must not collapse tenant boundaries.

The control plane may provide.

- tenant provisioning.
- policy distribution.
- conformance checks.
- health monitoring.
- usage metering.
- billing.
- partner operations.
- upgrade coordination.

## Data plane.

The data plane must preserve tenant boundaries.

Data moves packed in boxes.

Boxes remain tenant-scoped unless an explicit cross-tenant agreement permits exchange.

## Cross-tenant exchange.

Cross-tenant exchange requires.

- source tenant approval.
- destination tenant approval.
- temporal agreement.
- fine-grained access policy.
- policy enforcement.
- audit record.
- replay boundary.
- conformance evidence.

No implicit cross-tenant trust is allowed.

## Tenant index.

Every tenant must have a tenant-root index.

```text
tenant.
  index.
  boxes.
  nodes.
  agreements.
  streams.
  state.
```

No tenant-root index means no tenant fabric.

## Commercial boundary.

Multi-tenancy enables.

- DBaaS.
- enterprise workspaces.
- partner-operated tenants.
- reseller tenants.
- customer-managed tenants.
- edge tenant fabrics.
- internal business-unit fabrics.

## Conformance.

A tenant is conformant only when.

- tenant identity is unambiguous.
- tenant namespace is isolated.
- tenant boxes are indexed.
- tenant agreements are temporal.
- tenant policies are enforced.
- tenant streams are zero-loss, zero-trust, zero-touch.
- tenant replay limits are declared.
- tenant audit records are exportable.
- tenant state is reconciled through Fabric Loop.

## Final rule.

```text
FabricDB is multi-tenant by design.
Tenant boundaries are fabric boundaries.
Tenant state is mutually agreed and policy-bound.
```
