# 12/16/2023
# Setup load balancer 

resource "oci_load_balancer_load_balancer" "public_lb" {
  compartment_id = oci_identity_compartment.app_compartment.id
  display_name   = "Public_Load_Balancer"
  shape          = "100Mbps"  # Choose the appropriate shape

  subnet_ids = [oci_core_subnet.public_subnet.id]  # Assuming the load balancer is in the public subnet
  is_private = false

  ip_mode = "IPV4"

  reserved_ips {
    id = oci_core_public_ip.public_lb_ip.id
  }
}

resource "oci_load_balancer_backend_set" "bs_app" {
  load_balancer_id = oci_load_balancer_load_balancer.public_lb.id
  name             = "bs_app"
  policy           = "ROUND_ROBIN"

  health_checker {
    protocol = "HTTP"
    url_path = "/healthcheck.html"
    port     = 80
    response_body_regex = ".*ok.*"
    return_code = 200
  }

  backend {
    ip_address = "10.20.10.11"
    port       = 80
    weight     = 1
  }

  backend {
    ip_address = "10.20.10.12"
    port       = 80
    weight     = 1
  }
}

resource "oci_load_balancer_listener" "ls_80" {
  load_balancer_id = oci_load_balancer_load_balancer.public_lb.id
  name             = "LS_80"
  default_backend_set_name = oci_load_balancer_backend_set.bs_app.name
  port             = 80
  protocol         = "HTTP"

  # Optional: SSL configuration can be added here if needed
}

