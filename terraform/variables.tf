variable "SSH_PUB_KEY" {
  description = "Public SSH key for the server"
  type        = string
}

variable "VCN_APP_CIDR" {
  description = "CIDR block for the VCN"
  type        = string
}

variable "SUB_PUB_CIDR" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "SUB_PRIV_CIDR" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "SERVER_APP1_IP" {
  description = "Private IP address for server app1"
  type        = string
}

variable "SERVER_APP2_IP" {
  description = "Private IP address for server app2"
  type        = string
}

variable "DOMAIN_NAME" {
  description = "Domain name for the load balancer hostname in listener"
  type        = string
}
