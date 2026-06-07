// fabric.bf
// Canonical protocol-first declaration for fabric.db.

fabric fabric_db.v1 {
  rule protocol_first
  rule open_source_core
  rule no_vendor_lockin
  rule profiles_are_replaceable

  uses hardware substrate.v1
  uses kernel fabric_kernel.v1
  uses protocol box_protocol.v1
  uses contract microbox_contract.v1
}

hardware substrate.v1 {
  compute required
  memory required
  storage persistent required
  clock required
  entropy required
  boot_boundary required
  isolation required
  recovery required
  observability required
  network optional
  identity_anchor recommended
}

kernel fabric_kernel.v1 {
  primitive identity
  primitive state
  primitive event
  primitive policy
  primitive approval
  primitive decision
  primitive provenance
  primitive desired_state
  primitive observed_state
  primitive drift
  primitive reconciliation
  primitive conformance

  invariant governed_action {
    requires actor
    requires action
    requires subject
    requires policy_result
    emits event
    records provenance
  }

  invariant accountable_state_change {
    requires state_before
    requires state_after
    requires event
    requires actor
    requires timestamp
  }
}

protocol box_protocol.v1 {
  message input {
    source required
    schema required
    payload required
    timestamp required
  }

  message output {
    destination required
    schema required
    payload required
    provenance required
    timestamp required
  }

  message event {
    actor required
    action required
    subject required
    timestamp required
    provenance required
  }

  message conformance_report {
    box_id required
    contract required
    status required
    evidence required
    timestamp required
  }
}

contract microbox_contract.v1 {
  requires hardware substrate.v1
  requires kernel fabric_kernel.v1
  requires protocol box_protocol.v1

  component identity required
  component boundary required
  component state_store required
  component event_log required
  component policy_gate required
  component provenance_trail required
  component input_port required
  component output_port required
  component audit_surface required
  component recovery_path required
  component conformance_surface required
}

box microbox.v1 implements contract microbox_contract.v1 {
  lifecycle created
  lifecycle configured
  lifecycle sealed
  lifecycle active
  lifecycle degraded
  lifecycle reconciling
  lifecycle suspended
  lifecycle retired
  lifecycle archived
}

profile raspberry_pi.v1 implements contract microbox_contract.v1 {
  hardware_class arm64_edge_device
  minimum_ram_gb 4
  recommended_ram_gb 8
  storage reliable_required
  network wired_recommended

  os replaceable
  runtime replaceable
  state_store replaceable
}

profile ubuntu_core_custom.v1 implements contract microbox_contract.v1 {
  os ubuntu_core
  runtime snap
  state_store replaceable
  profile_type appliance
}

profile ubuntu_server_arm64.v1 implements contract microbox_contract.v1 {
  os ubuntu_server_arm64
  runtime systemd_or_oci
  state_store replaceable
  profile_type server
}

profile linux_preempt_rt.v1 implements contract microbox_contract.v1 {
  kernel linux_preempt_rt
  profile_type realtime
  requires deterministic_scheduling recommended
}

profile microstack.v1 implements contract microbox_contract.v1 {
  cloud local_openstack
  profile_type cloud_in_a_box
  state_store replaceable
}
