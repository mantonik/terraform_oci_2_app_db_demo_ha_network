# 12/16/2023
# script is updating the security list with rules for access 
# 12/17 move this code to file 001
#####################################
# resource "oci_core_security_list" "sl_sub_pub" {
#   compartment_id = oci_identity_compartment.app_compartment.id
#   vcn_id         = oci_core_vcn.app_vcn.id
#   display_name   = "SL_SUB_PUB"
# 
#   egress_security_rules {
#     # Your existing egress rules (if any)
#   }
# 
#   ingress_security_rules {
#     protocol = "6" # TCP protocol
#     source   = "0.0.0.0/0"
# 
#     tcp_options {
#       "min" = 80
#       "max" = 80
#     }
#     description = "Allow HTTP traffic"
#   }
# 
#   ingress_security_rules {
#     protocol = "6" # TCP protocol
#     source   = "0.0.0.0/0"
# 
#     tcp_options {
#       "min" = 443
#       "max" = 443
#     }
#     description = "Allow HTTPS traffic"
#   }
# }

###################################
#Add static IP address
#
#resource "oci_core_public_ip" "public_lb_ip" {
#  compartment_id = oci_identity_compartment.app_compartment.id
#  display_name   = "Public_LB_IP"
#  lifetime       = "RESERVED"
#
#  # Assigning to a specific VCN if required
#  # vcn_id = oci_core_vcn.app_vcn.id
#
#  # Assigning to a specific private IP if required
#  # private_ip_id = oci_core_private_ip.example.id
#
#  freeform_tags = {
#    "Description" = "IP for public LB"
#  }
#}
#

