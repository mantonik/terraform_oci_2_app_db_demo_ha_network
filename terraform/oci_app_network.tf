resource "oci_core_instance" "app1" {
  # ...
  create_vnic_details {
    # ...
    private_ip       = var.SERVER_APP1_IP
  }

  metadata = {
    ssh_authorized_keys = var.SSH_PUB_KEY
  }
  # ...
}

# Similar changes will be made throughout your Terraform configuration
# where these variables are needed.
# additinal comment

################################
# END
################################