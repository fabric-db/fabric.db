# Delivery Model.

FabricDB is delivered commercially as a cloud-native database-as-a-service.

The core model is held by contract.

The market offering is operated through managed service, partner, and enterprise deployment models.

## Primary delivery model.

```text
FabricDB as a Service.
```

FabricDB as a Service provides managed structured multimodel graph database capability for boxes, nodes, agreements, tuplets, streams, indexes, policies, state, and Fabric Loop reconciliation.

## Cloud-native foundation.

FabricDB delivery should prefer cloud-native infrastructure and CNCF-mature ecosystem components where appropriate.

Preferred profile families.

- Kubernetes for orchestration.
- OCI for artifacts.
- Buildpacks for source-to-image builder profile.
- OpenTelemetry for observability.
- Open Policy Agent for policy enforcement.
- Gatekeeper for Kubernetes gate control.
- CloudEvents for event envelopes.
- Container registry for artifact distribution.

## DBaaS responsibilities.

The managed service must provide.

- tenant provisioning.
- box index management.
- graph persistence.
- agreement registry.
- policy registry.
- tuple relation storage.
- stream coordination.
- replay capability declaration.
- Fabric Loop reconciliation.
- stable state monitoring.
- backup and restore.
- conformance reporting.
- audit export.
- partner integration surface.

## Commercial delivery options.

### Managed cloud service.

Hosted FabricDB DBaaS operated by the contract holder or authorized cloud partner.

### Private cloud service.

FabricDB deployed inside customer-controlled Kubernetes, OpenStack, MicroStack, or cloud-native infrastructure.

### Edge service.

FabricDB microbox profiles deployed to edge hardware, Raspberry Pi, Ubuntu Core, PREEMPT_RT, or appliance-like environments.

### Enterprise self-managed service.

Customer operates FabricDB under commercial license, support, certification, and governance obligations.

### OEM / embedded service.

Partner embeds FabricDB-compatible box and fabric capabilities inside their own product under commercial agreement.

## CNCF maturity preference.

Use CNCF-mature or broadly adopted cloud-native projects when they satisfy the profile contract.

The maturity preference is not lock-in.

It is a risk reduction rule.

## Service-level promises.

FabricDB DBaaS should declare.

- uptime target.
- replay window.
- zero-loss transfer scope.
- recovery point objective.
- recovery time objective.
- data residency.
- encryption posture.
- access policy posture.
- audit retention.
- conformance level.

## Core separation.

```text
Core.
  Defines the model and contract.

DBaaS.
  Operates the model commercially.

Partner.
  Extends or delivers the service by agreement.
```

## Final rule.

```text
FabricDB is cloud-native by delivery.
FabricDB is open-core by model.
FabricDB is commercial by service.
```
