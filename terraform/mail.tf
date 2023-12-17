provider "oci" {
  # Specify your Oracle Cloud Infrastructure configuration here
  # region      = "..."
  # tenancy_ocid = "..."
  # user_ocid    = "..."
  # fingerprint = "..."
  # private_key_path = "..."
}

resource "oci_identity_compartment" "comp_app" {
  name        = "COMP_APP"
  description = "Compartment for application resources"
  enable_delete = true
}

resource "oci_core_vcn" "vcn_app" {
  compartment_id = oci_identity_compartment.comp_app.id
  cidr_block     = "10.0.0.0/16"
  display_name   = "VCN_APP"
}

output "compartment_id" {
  value = oci_identity_compartment.comp_app.id
}

output "vcn_id" {
  value = oci_core_vcn.vcn_app.id
}
