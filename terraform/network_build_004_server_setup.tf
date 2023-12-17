# 12/16/2023 
# setup servers 
#
#
resource "oci_core_instance" "app1" {
  availability_domain = "FD1"  # Replace with actual availability domain
  compartment_id      = oci_identity_compartment.app_compartment.id
  display_name        = "app1"
  shape               = "VM.Standard.A1.Flex"  # Example ARM shape, adjust as needed

  create_vnic_details {
    subnet_id        = oci_core_subnet.public_subnet.id  # Assuming this is the ID of your public subnet
    display_name     = "app1_vnic"
    assign_public_ip = true
    private_ip       = "10.20.10.11"
  }

  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAUHJHG12345..."  # Replace with your actual SSH public key
  }

  source_details {
    source_type = "image"
    image_id    = "ocid1.image.oc1..example"  # Replace with the OCID of the image you want to use
  }git

  shape_config {
    # Define shape configuration, like OCPUs and memory, if necessary
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum -y update
    # Add additional initialization commands here
    EOF
  )
}

# Repeat the above resource block for app2 with the appropriate modifications
