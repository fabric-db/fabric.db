// zero-zero-zero.bf
// Zero Loss. Zero Trust. Zero Touch.

transfer_protocol zero_zero_zero.v1 {
  definition "zero loss, zero trust, zero touch"
  meaning "box streams must preserve data, assume no trust, and never touch the box boundary"

  applies_to box.v1
  applies_to stream
  applies_to tunnel
  applies_to event
  applies_to state

  zero_loss {
    requires complete_transfer
    requires ordered_delivery
    requires acknowledgement
    requires checksum
    requires duplicate_detection
    requires idempotency_key
    requires replay_capability
  }

  zero_trust {
    requires identity_verification
    requires agreement
    requires policy_decision
    requires proof
    requires audit_record
    requires no_implicit_trust
  }

  zero_touch {
    requires stream_only_interaction
    requires no_direct_access
    requires no_raw_opening
    requires no_boundary_touch
    requires controlled_view optional
  }

  rule data_moves_as_locked_box
  rule every_transfer_is_verified
  rule every_access_is_agreement_bound
  rule every_decision_is_policy_bound
  rule every_stream_is_auditable
  rule no_raw_data_transfer
  rule no_untrusted_transfer
  rule no_touch_transfer

  invariant zero_loss
  invariant zero_trust
  invariant zero_touch
  invariant box_boundary_is_preserved
  invariant stable_state_depends_on_zero_zero_zero
}
