// replay-capability.bf
// Events are replayable up to declared capability limits.

replay_model replay_capability.v1 {
  definition "every event is replayable up to the extent decided by hardware capability, database size, retention policy, and index depth"

  applies_to event
  applies_to stream
  applies_to box.v1
  applies_to state

  replay_boundary {
    requires hardware_capacity
    requires database_size
    requires retention_policy
    requires index_depth
    requires storage_window
    requires time_boundary
  }

  event_record {
    requires event_id
    requires box_id
    requires stream_id optional
    requires state_ref
    requires agreement_ref
    requires policy_ref
    requires provenance_ref
    requires recorded_at
  }

  replay_capability {
    requires can_replay_from
    requires can_replay_until
    requires max_depth
    requires max_size
    requires capability_holder
    requires declared_limits
  }

  rule every_event_is_replayable_within_declared_capability
  rule replay_is_time_bound
  rule replay_is_index_bound
  rule replay_is_storage_bound
  rule replay_must_preserve_provenance
  rule replay_must_respect_policy
  rule no_unbounded_replay_claim

  invariant event_replayability_is_declared
  invariant replay_limit_is_part_of_conformance
  invariant replay_beyond_capability_is_not_guaranteed
  invariant stable_state_uses_available_replay_window
}
