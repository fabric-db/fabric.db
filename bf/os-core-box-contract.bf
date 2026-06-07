// os-core-box-contract.bf
// Contract: OS core is the box; box is the OS core.

contract os_core_box.v1 {
  definition "the agreement that a concrete OS core instance is the box boundary"
  meaning "for this deployment profile, the OS core and the box are the same accountable boundary"

  binds os_core to box.v1
  binds box.v1 to os_core

  requires hardware substrate.v1
  requires box box.v1

  os_core {
    definition "the minimal operating substrate that executes, isolates, stores, encrypts, observes, and recovers the box"
    requires execution
    requires isolation
    requires storage
    requires network optional
    requires clock
    requires crypto
    requires identity_anchor optional
    requires recovery
    requires observability
  }

  box_boundary {
    definition "the accountable boundary exposed by the OS core"
    requires identity
    requires time_boundary
    requires unit_of_work
    requires data_boundary
    requires crypto_boundary
    requires no_implicit_trust
    requires state
    requires branch
    requires link
  }

  data_rule {
    data_moves_in_box_units
    data_stays_in_box_units
    data_at_rest_encrypted
    data_in_motion_encrypted
    no_plaintext_crossing_without_agreement
  }

  trust_rule {
    no_implicit_trust
    every_exchange_verified
    every_access_agreement_bound
    every_decryption_accountable
  }

  invariant os_core_is_box
  invariant box_is_os_core
  invariant one_os_core_instance_equals_one_accountable_box_boundary
  invariant encrypted_data_moves_and_stays_by_box
  invariant no_trust_without_explicit_agreement
}

profile os_core_box_profile.v1 implements contract os_core_box.v1 {
  profile_type deployment_contract
  core_vendor_lockin false
  implementation_replaceable true
}
