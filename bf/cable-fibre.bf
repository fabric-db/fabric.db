// cable-fibre.bf
// Cable and fibre transport profiles for fabric streams.

transport_model cable_fibre.v1 {
  definition "cable is a bounded carrier path; fibre is a high-capacity low-loss cable profile"
  meaning "data moves packed in locked boxes over governed stream paths; cable and fibre describe the transport material, not the fabric core"

  cable {
    definition "a bounded carrier that transports encrypted box streams between locations"
    requires cable_id
    requires source_location
    requires destination_location
    requires path
    requires capacity
    requires latency
    requires integrity
    requires policy
    requires agreement
    requires time_boundary
  }

  fibre {
    definition "a fibre-optic cable profile for high-capacity, low-loss, long-distance encrypted box streams"
    is cable
    medium optical
    requires wavelength optional
    requires bandwidth
    requires attenuation
    requires endpoint_transceiver
  }

  stream_carriage {
    carries box.v1
    carries encrypted_stream
    requires index
    requires agreement
    requires policy
    requires proof
    requires replay_capability
  }

  rule cable_is_transport_profile
  rule fibre_is_cable_profile
  rule cable_does_not_define_box
  rule fibre_does_not_define_fabric
  rule transport_must_not_open_box
  rule transport_carries_locked_boxes
  rule transport_is_policy_bound
  rule transport_is_agreement_bound

  invariant data_moves_packed_in_boxes
  invariant cable_carries_streams
  invariant fibre_carries_streams
  invariant every_transport_path_is_traversable
  invariant every_transport_path_has_time_and_location
  invariant no_raw_data_transport
}
