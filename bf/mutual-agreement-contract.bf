// mutual-agreement-contract.bf
// FabricDB holds the mutual agreement contract.

contract mutual_agreement_contract.v1 {
  definition "FabricDB holds the contract that decisions, conformance, state, and reconciliation must happen in a mutually agreeable manner"

  applies_to node.v1
  applies_to box.v1
  applies_to agreement.v1
  applies_to state
  applies_to decision
  applies_to conformance
  applies_to fabric_loop.v1

  mutual_agreement {
    requires stakeholders
    requires node_approval
    requires state_approval
    requires policy_decision
    requires conformance_result
    requires evidence
    requires time
    requires provenance
  }

  decision_lock {
    requires decision_id
    requires actor
    requires objective
    requires agreement
    requires policy_result
    requires conformance_result
    requires timestamp
  }

  state_record {
    requires state_id
    requires accepted_truth
    requires decision_ref
    requires agreement_ref
    requires provenance_ref
    requires recorded_at
  }

  rule no_unilateral_decision
  rule no_conformance_without_mutual_agreement
  rule no_state_without_mutual_acceptance
  rule reconciliation_must_be_mutually_agreeable
  rule fabricdb_records_the_contract

  invariant fabricdb_holds_mutual_agreement_contract
  invariant conformance_is_locked_in_decision
  invariant decision_is_locked_in_state
  invariant stable_state_requires_mutual_agreement
}
