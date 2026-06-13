// reference-node.bf
// A box expressed as the canonical reference node form.

reference_node box.v1 {
  kind box
  role accountable_boundary

  requires hardware substrate.v1
  requires kernel fabric_kernel.v1
  requires protocol box_protocol.v1
  requires contract microbox_contract.v1

  identity {
    node_id required
    holder required
    owner required
    trust_domain required
    lifecycle required
  }

  boundary {
    scope required
    inside required
    outside required
    authority required
    input_surface required
    output_surface required
  }

  kernel_surface {
    state_store required
    event_log required
    policy_gate required
    decision_record required
    provenance_trail required
    reconciliation_path required
    conformance_surface required
  }

  edge_surface {
    input_port required
    output_port required
    audit_surface required
    export_surface optional
    import_surface optional
  }

  messages {
    accepts input
    emits output
    emits event
    emits conformance_report
    accepts reconciliation_request optional
    emits reconciliation_result optional
  }

  invariants {
    every_input typed
    every_output typed
    every_crossing attributed
    every_governed_action policy_checked
    every_state_change event_recorded
    every_output provenance_recorded
    every_drift reconciled_or_waived
  }
}

node_profile microbox_reference_node.v1 implements reference_node box.v1 {
  size smallest_deployable
  capability microfabric
  deployment_boundary required
  federation_ready recommended
}
