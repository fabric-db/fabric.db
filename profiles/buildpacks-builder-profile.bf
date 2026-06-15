// buildpacks-builder-profile.bf
// CNCF Buildpacks as a replaceable builder profile.

profile buildpacks_builder_profile.v1 {
  definition "CNCF Buildpacks is a replaceable builder profile for turning source into OCI artifacts for boxes and blocks"

  implements builder_profile.v1
  implements oci_artifact_builder.v1

  profile_type builder
  core_vendor_lockin false
  implementation_replaceable true

  input source required
  output oci_image required

  builds box_artifact
  builds block_artifact
  builds microbox_artifact

  rule source_to_image
  rule no_dockerfile_required
  rule oci_artifact_output
  rule builder_is_profile_not_core

  invariant buildpack_does_not_define_box
  invariant buildpack_builds_box_artifacts
  invariant box_contract_defines_shape
  invariant any_conformant_builder_can_build_box
}
