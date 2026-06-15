// stable-core-state.bf
// Stable core is mandatory; stable state is the objective.

fabric_stability fabric_stability.v1 {
  definition "stable core is mandatory for stable state"

  stable_core {
    definition "the invariant machinery required to produce and preserve stable state"
    requires node_identity
    requires node_accessibility
    requires box_boundary
    requires agreement_bridge
    requires tuplet_relation
    requires access_policy
    requires governance_policy
    requires policy_enforcement
    requires gate_control
    requires reconciliation_loop
    requires provenance
    requires conformance
  }

  stable_state {
    definition "the mutually accepted state produced by reconciliation across nodes, agreements, policies, evidence, and recorded truth"
    requires node_acceptance
    requires state_acceptance
    requires agreement_preserved
    requires policy_satisfied
    requires evidence
    requires provenance
    requires timestamp
  }

  rule stable_core_is_mandatory
  rule stable_state_is_the_goal
  rule stable_core_produces_stable_state
  rule stable_core_must_not_be_vendor_locked
  rule stable_core_must_be_open_source
  rule stable_core_must_be_protocol_first

  invariant no_stable_state_without_stable_core
  invariant no_fabric_without_stable_core
  invariant no_reconciliation_without_stable_core
  invariant no_chain_without_stable_core
}
