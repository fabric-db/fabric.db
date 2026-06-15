// opa-enforcer-profile.bf
// Open Policy Agent as the policy enforcer profile.

profile opa_enforcer_profile.v1 {
  definition "Open Policy Agent is a replaceable enforcer profile for governance policy decisions at fabric gates"

  implements policy_enforcement.v1
  implements governance_gate.v1

  profile_type policy_enforcer
  core_vendor_lockin false
  implementation_replaceable true

  enforces governance_policy
  enforces agreement_policy
  enforces stream_policy
  enforces access_policy

  input {
    subject required
    action required
    object required
    agreement required
    context required
    time required
  }

  decision {
    allow required
    deny optional
    obligations optional
    constraints optional
    reason required
  }

  gate {
    left_gate optional
    right_gate optional
    stream_gate optional
    box_gate optional
  }

  invariant opa_is_enforcer_profile_not_core
  invariant every_gate_requires_policy_decision
  invariant denied_decision_blocks_bridge
  invariant denied_decision_blocks_stream
  invariant no_policy_decision_no_access
}
