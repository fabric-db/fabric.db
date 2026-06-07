// box-core.bf
// Simplified canonical definition of Box.

box box.v1 {
  definition "the immutable canonical core atomic particle that constructs fabric.db"
  meaning "a digital twin meta-model of real-world accountability"

  nature immutable_canonical_core
  scale atomic_particle
  role constructs_fabric_db
  model digital_twin_meta_model
  referent real_world

  contains state required
  contains branch required
  contains link required

  state {
    definition "what is true inside the box at a point in time"
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
    requires policy_result
  }

  link {
    definition "a typed traceable relation between boxes, states, branches, events, or real-world referents"
    requires from
    requires to
    requires relation
    requires evidence
    requires timestamp
  }

  invariant immutable_identity
  invariant state_is_versioned
  invariant branch_is_governed
  invariant link_is_traceable
  invariant every_change_preserves_provenance
  invariant every_real_world_reference_is_linked
}

fabric_db fabric_db.v1 {
  definition "a composition of canonical boxes that digitally twin real-world state, change, relation, and accountability"

  constructed_from box.v1
  preserves state
  preserves branch
  preserves link
  preserves provenance
  preserves conformance
}
