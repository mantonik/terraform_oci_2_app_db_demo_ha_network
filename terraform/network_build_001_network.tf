#
# update security list
# add static IP 
#################################
provider "oci" {
  # Authentication details
}

resource "oci_identity_compartment" "app_compartment" {
  name        = "APP"
  description = "Compartment for APP"
  enable_delete = true
}

resource "oci_core_vcn" "vcn_app" {
  compartment_id = oci_identity_compartment.app_compartment.id
  cidr_block     = "10.20.10.0/24"
  display_name   = "APP_VCN"
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.vcn_app.id
  cidr_block     = "10.20.10.0/27"
  display_name   = "Public_Subnet"
  security_list_ids = [oci_core_security_list.sl_sub_pub.id]
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.vcn_app.id
  cidr_block     = "10.20.10.32/27"
  display_name   = "Private_Subnet"
  security_list_ids = [oci_core_security_list.sl_sub_priv.id]
}

resource "oci_core_security_list" "sl_sub_pub" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.vcn_app.id
  display_name   = "SL_SUB_PUB"
  # Add your security rules here

  egress_security_rules {
    # Your existing egress rules (if any)
  }

  ingress_security_rules {
    protocol = "6" # TCP protocol
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
    description = "Allow HTTP traffic"
  }

  ingress_security_rules {
    protocol = "6" # TCP protocol
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
    description = "Allow HTTPS traffic"
  }


}

resource "oci_core_security_list" "sl_sub_priv" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.app_vcn.id
  display_name   = "SL_SUB_PRIV"
  # Add your security rules here
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.app_vcn.id
  display_name   = "Internet_Gateway"
}

resource "oci_core_nat_gateway" "natgw" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.app_vcn.id
  display_name   = "NAT_Gateway"
}

resource "oci_core_service_gateway" "sgw" {
  compartment_id = oci_identity_compartment.app_compartment.id
  vcn_id         = oci_core_vcn.app_vcn.id
  display_name   = "Service_Gateway"
  # Define services to enable on the service gateway
}

###################################
#Add static IP address
#
resource "oci_core_public_ip" "public_lb_ip" {
  compartment_id = oci_identity_compartment.app_compartment.id
  display_name   = "Public_LB_IP"
  lifetime       = "RESERVED"

  # Assigning to a specific VCN if required
  # vcn_id = oci_core_vcn.app_vcn.id

  # Assigning to a specific private IP if required
  # private_ip_id = oci_core_private_ip.example.id

  freeform_tags = {
    "Description" = "IP for public LB"
  }
}
