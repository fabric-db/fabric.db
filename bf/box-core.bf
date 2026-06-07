// box-core.bf
// Canonical definition of Box.

box box.v1 {
  definition "the smallest building block of fabric"
  meaning "one work box is one real-world, real-time, tangible unit of work"
  purpose "bring stability, fairness, and equality to work by bounding every unit of work under explicit identity, time, state, agreement, and accountability"

  nature immutable_canonical_core
  scale atomic_particle
  role constructs_fabric_db
  model digital_twin_meta_model
  referent real_world

  contains identity required
  contains time_boundary required
  contains unit_of_work required
  contains node required
  contains agreement required
  contains state required
  contains branch required
  contains link required

  identity {
    definition "the unique identity of the box as a bounded reality"
    requires box_id
    requires holder
    requires owner
    requires trust_domain
    requires lifecycle
    requires created_at
  }

  time_boundary {
    definition "the real-time boundary within which the box exists, is observed, and is accountable"
    requires valid_from
    requires valid_to optional
    requires observed_at
    requires version
    requires lifecycle
  }

  unit_of_work {
    definition "the tangible real-world work held by the box"
    requires work_id
    requires objective
    requires actor
    requires real_world_referent
    requires expected_outcome
    requires constraints
    requires acceptance_criteria
    requires completion_state
  }

  node {
    definition "an identifiable thing inside the bounded reality"
    requires identity
    requires type
    requires state
    requires holder
    requires timestamp
  }

  agreement {
    definition "a governed understanding between nodes"
    requires parties
    requires terms
    requires scope
    requires validity
    requires holder
    requires evidence
    requires timestamp
  }

  state {
    definition "what is true inside the bounded reality at a point in time"
    requires identity
    requires value
    requires version
    requires provenance
    requires timestamp
  }

  branch {
    definition "a governed possible path from one state to another"
    requires parent_state
    requires proposed_state
    requires reason
    requires decision
    requires agreement
  }

  link {
    definition "a typed traceable relation between nodes, agreements, states, branches, boxes, or real-world referents"
    requires from
    requires to
    requires relation
    requires evidence
    requires timestamp
  }

  invariant smallest_building_block_of_fabric
  invariant one_work_box_equals_one_real_world_real_time_tangible_unit
  invariant box_has_identity
  invariant box_is_bounded_by_time
  invariant box_is_unit_of_work
  invariant box_brings_stability_by_preserving_clear_state_and_boundaries
  invariant box_brings_fairness_by_applying_same_agreements_to_same_conditions
  invariant box_brings_equality_by_making_every_unit_of_work_identifiable_and_auditable
  invariant bounded_reality_is_explicit
  invariant every_node_is_identifiable
  invariant every_agreement_has_parties
  invariant every_agreement_has_terms
  invariant state_is_versioned
  invariant branch_is_governed_by_agreement
  invariant link_is_traceable
  invariant every_change_preserves_provenance
  invariant every_real_world_reference_is_linked
}

fabric_db fabric_db.v1 {
  definition "a composition of work boxes that digitally twin real-world, real-time, tangible units of work"
  purpose "make work stable, fair, equal, traceable, and accountable through boxes"

  constructed_from box.v1
  preserves identity
  preserves time_boundary
  preserves unit_of_work
  preserves node
  preserves agreement
  preserves state
  preserves branch
  preserves link
  preserves provenance
  preserves conformance
  preserves stability
  preserves fairness
  preserves equality
}
