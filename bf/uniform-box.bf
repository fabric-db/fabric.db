// uniform-box.bf
// Uniform Box: real-time, reactive, stream-only.

box_behavior uniform_box.v1 {
  definition "a box is a uniform real-time reactive shape"
  purpose "remove the need for swiss-knife special-case interfaces by making every box interact through the same stream protocol"

  applies_to box.v1
  requires fabric_loop.v1

  shape uniform
  behavior realtime
  behavior reactive
  boundary locked
  interaction stream_only

  rule no_swiss_knife_interfaces
  rule no_special_case_touch
  rule no_direct_opening
  rule receive_streams_only
  rule emit_streams_only
  rule every_reaction_goes_through_fabric_loop
  rule every_reaction_preserves_box_boundary

  realtime {
    requires observed_at
    requires event_time
    requires processing_time
    requires state_version
  }

  reactive {
    input encrypted_stream
    evaluate agreement
    evaluate policy
    propose state_change
    reconcile through fabric_loop
    emit encrypted_stream
    record provenance
  }

  invariant box_shape_is_uniform
  invariant uniform_shape_removes_special_case_interfaces
  invariant box_is_realtime
  invariant box_is_reactive
  invariant reaction_is_stream_triggered
  invariant reaction_is_agreement_bound
  invariant reaction_is_policy_bound
  invariant reaction_preserves_locked_boundary
}
