// fabric-loop.bf
// Fabric Loop: required for stable state, not merely stable core.

fabric_loop fabric_loop.v1 {
  definition "the continuous loop that aligns nodes with state in a mutually agreeable manner"
  purpose "produce and preserve stable state across the fabric"

  requires node.v1
  requires agreement
  requires state
  requires policy
  requires evidence

  stable_state {
    definition "state accepted by the node, recorded state, governing agreement, policy, and evidence after reconciliation"
    requires node_acceptance
    requires state_acceptance
    requires agreement_preserved
    requires policy_satisfied
    requires evidence
    requires provenance
    requires timestamp
  }

  phase observe {
    read node_state
    read recorded_state
    read agreement_state
    read policy_state
    emit observation
  }

  phase compare {
    input node_state
    input recorded_state
    input agreement_state
    input policy_state
    emit difference
  }

  phase propose {
    input difference
    emit proposed_alignment
    requires reason
    requires evidence
  }

  phase negotiate {
    input proposed_alignment
    requires node_acceptance
    requires state_acceptance
    requires agreement_terms
    requires policy_constraints
    emit mutual_alignment_decision
  }

  phase approve {
    input mutual_alignment_decision
    requires node_approval
    requires state_approval
    emit approved_alignment
  }

  phase apply {
    input approved_alignment
    update node_state optional
    update recorded_state optional
    emit state_transition
  }

  phase record {
    input state_transition
    emit reconciliation_event
    emit provenance_record
    emit conformance_record
  }

  phase verify {
    input reconciliation_event
    verify node_aligned_with_state
    verify agreement_preserved
    verify policy_satisfied
    emit reconciliation_result
  }

  phase stream {
    input reconciliation_result
    emit encrypted_stream
    requires agreement
    requires audit
  }

  transition observe -> compare
  transition compare -> propose
  transition propose -> negotiate
  transition negotiate -> approve
  transition approve -> apply
  transition apply -> record
  transition record -> verify
  transition verify -> stream
  transition stream -> observe

  invariant fabric_loop_required_for_stable_state
  invariant stable_state_is_the_goal
  invariant stable_core_is_only_the_mechanism
  invariant reconciliation_is_mutual
  invariant node_cannot_be_overwritten_unilaterally
  invariant state_cannot_be_overwritten_unilaterally
  invariant alignment_requires_agreement
  invariant alignment_requires_policy
  invariant alignment_requires_evidence
  invariant every_reconciliation_is_recorded
  invariant every_reconciliation_preserves_provenance
}
