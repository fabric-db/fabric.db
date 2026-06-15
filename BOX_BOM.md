# Box Bill of Materials

The Box Bill of Materials defines the minimum parts required to build an accountable box.

A box is not complete because it runs.
A box is complete when it can identify itself, hold state, govern actions, record evidence, expose conformance, and reconcile drift.

## BOM levels

```text
L0 Minimal Box
L1 Governed Box
L2 Reconciled Box
L3 Federated Box
```

## L0 Minimal Box

The minimal box is the smallest accountable runtime boundary.

Required components:

| Component | Purpose | Required Artifact |
|---|---|---|
| Box Identity | Identify the box | box_id |
| Boundary | Define inside/outside | boundary manifest |
| State Store | Hold current state | state table / namespace |
| Event Log | Record what happened | append-only event stream |
| Input Port | Receive typed input | input contract |
| Output Port | Emit typed output | output contract |

L0 answers:

```text
Who am I?
What is inside me?
What entered?
What changed?
What left?
```

## L1 Governed Box

The governed box adds policy and provenance.

Required components:

| Component | Purpose | Required Artifact |
|---|---|---|
| Policy Gate | Allow, deny, or require approval | policy result |
| Approval Record | Capture human/system authorization | approval record |
| Decision Record | Explain why an action happened | decision log |
| Provenance Trail | Preserve source and evidence | provenance record |
| Audit Surface | Expose evidence for review | audit view |

L1 answers:

```text
Was this allowed?
Who approved it?
Why did it happen?
Where did the evidence come from?
Can it be audited?
```

## L2 Reconciled Box

The reconciled box adds desired state, observed state, drift, and correction path.

Required components:

| Component | Purpose | Required Artifact |
|---|---|---|
| Desired State | Declare intended state | desired_state record |
| Observed State | Capture actual state | observed_state record |
| Drift Detector | Compare intended and actual state | drift record |
| Reconciler | Record correction path | reconciliation record |
| Conformance Surface | Prove contract alignment | conformance report |

L2 answers:

```text
What should be true?
What is actually true?
What drifted?
What will reconcile it?
Did it become conformant again?
```

## L3 Federated Box

The federated box can cooperate with other boxes through explicit trust and contract boundaries.

Required components:

| Component | Purpose | Required Artifact |
|---|---|---|
| Trust Domain | Define trust boundary | trust manifest |
| Federation Contract | Define inter-box exchange | federation contract |
| Capability Manifest | Declare what the box can do | capability manifest |
| Schema Manifest | Declare supported schemas | schema manifest |
| Policy Manifest | Declare policy surface | policy manifest |
| Export Surface | Emit portable evidence | export bundle |
| Import Surface | Receive external evidence | import bundle |

L3 answers:

```text
Who can I trust?
What can I exchange?
What capabilities do I expose?
What contracts do I obey?
How do I prove conformance to another box?
```

## Physical BOM

A box may be implemented with different physical materials.

Recommended minimal implementation:

| Layer | Default | Alternatives |
|---|---|---|
| Operating system | Ubuntu | Debian, Fedora CoreOS, Alpine |
| Runtime boundary | Container | Process, VM, k8s pod, bare-metal service |
| Database | SurrealDB | PostgreSQL, SQLite, FoundationDB |
| Event transport | Local append log | NATS, Kafka, CloudEvents broker |
| Policy | Embedded policy records | OPA, OpenFGA, AuthZEN |
| Identity | Local actor records | DID/VC, OIDC, SPIFFE |
| Packaging | OCI image | Debian package, snap, binary tarball |
| Deployment | Docker / Podman | k3s, MicroK8s, systemd |
| Conformance | GitHub Actions | local conformance runner |

## Logical BOM

The logical box is technology-independent.

```text
Identity
Boundary
State
Events
Policy
Approvals
Decisions
Provenance
Desired State
Observed State
Drift
Reconciliation
Conformance
Audit
```

## Data BOM

The minimum data records are:

```text
tenant
actor
box
boundary
state
event
policy
approval
decision
provenance
desired_state
observed_state
drift
reconciliation
conformance_report
```

## Contract BOM

The minimum contracts are:

```text
identity contract
input contract
output contract
state contract
event contract
policy contract
decision contract
provenance contract
reconciliation contract
conformance contract
federation contract
```

## Security BOM

The minimum security material is:

```text
box identity
owner identity
actor identity
secret boundary
policy gate
audit trail
approval path
revocation path
export controls
import validation
```

## Observability BOM

The minimum observable signals are:

```text
health
readiness
state version
event count
policy decisions
approval latency
drift count
reconciliation status
conformance status
audit availability
```

## Minimal viable box

A minimal viable box must include:

```text
box identity
boundary manifest
state store
event log
input contract
output contract
policy gate
provenance record
```

Without these, it may be a service, database, container, or process, but it is not yet a box.

## Full governed box

A full governed box must include:

```text
box identity
boundary manifest
state store
event log
input port
output port
policy gate
approval record
decision record
provenance trail
desired state
observed state
drift detector
reconciler
conformance surface
audit surface
federation contract
```

## Principle

A box is a billable, governable, auditable unit of responsibility.

If it cannot be inventoried, it cannot be governed.
If it cannot be governed, it cannot be trusted.
