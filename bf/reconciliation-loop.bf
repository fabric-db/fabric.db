// reconciliation-loop.bf
// Reconciliation aligns node with state in a mutually agreeable manner.

reconciliation_loop node_state_reconciliation.v1 {
  definition "the reconciliation loop aligns node with state in a mutually agreeable manner"

  requires node.v1
  requires agreement
  requires state

  phase observe {
    read node_state
    read recorded_state
    emit observation
  }

  phase compare {
    input node_state
    input recorded_state
    emit diff
  }

  phase propose {
    input diff
    emit proposed_alignment
    requires reason
    requires evidence
  }

  phase negotiate {
    input proposed_alignment
    requires node_acceptance
    requires state_acceptance
    requires agreement_terms
    emit mutual_alignment_decision
  }

  phase approve {
    input mutual_alignment_decision
    requires left_node_approval optional
    requires right_node_approval optional
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
    emit reconciliation_result
  }

  invariant reconciliation_is_mutual
  invariant node_cannot_be_overwritten_unilaterally
  invariant state_cannot_be_overwritten_unilaterally
  invariant alignment_requires_agreement
  invariant alignment_requires_evidence
  invariant every_reconciliation_is_recorded
  invariant every_reconciliation_preserves_provenance
}
