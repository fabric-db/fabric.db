// sync-tunnel.bf
// Data sync happens through governed tunnels.

sync_model sync_tunnel.v1 {
  definition "data sync happens through tunnels"
  meaning "a tunnel is a governed stream path between locked boxes"

  applies_to box.v1
  applies_to stream
  applies_to agreement.v1

  tunnel {
    requires tunnel_id
    requires source_box
    requires destination_box
    requires agreement
    requires policy
    requires time_boundary
    requires source_location
    requires destination_location
    requires path
    requires replay_capability
  }

  sync_stream {
    carries box.v1
    requires encrypted_transport
    requires index
    requires provenance
    requires state_ref
    requires event_ref
    requires replay_window
  }

  rule tunnel_is_governed_stream_path
  rule sync_moves_box_units
  rule no_raw_data_sync
  rule no_unbounded_tunnel
  rule no_tunnel_without_agreement
  rule no_tunnel_without_policy
  rule no_tunnel_without_time_boundary
  rule no_tunnel_without_traversable_path

  invariant data_sync_happens_through_tunnels
  invariant tunnel_does_not_open_box
  invariant tunnel_preserves_locked_boundary
  invariant tunnel_is_policy_bound
  invariant tunnel_is_agreement_bound
  invariant tunnel_is_replay_capability_bound
}
