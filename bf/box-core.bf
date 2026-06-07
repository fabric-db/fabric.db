// box-core.bf
// Canonical definition of Box.

box box.v1 {
  definition "the smallest building block of fabric"
  meaning "a bounded reality that holds nodes and the agreements between them"

  nature immutable_canonical_core
  scale atomic_particle
  role constructs_fabric_db
  model digital_twin_meta_model
  referent real_world

  contains node required
  contains agreement required
  contains state required
  contains branch required
  contains link required

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
  definition "a composition of boxes that digitally twin real-world nodes, agreements, state, change, relation, and accountability"

  constructed_from box.v1
  preserves node
  preserves agreement
  preserves state
  preserves branch
  preserves link
  preserves provenance
  preserves conformance
}
