variable "network_name" {
  type    = string
  description = "name of the compute network to which firewall rules has to be attached"
}

variable "firewall_name" {
  type    = string
  description = "name of the firewall"
}

variable "tcp_ports" {
  type    = list(string)
  description = "list of the tcp ports to be enabled"
}

variable "source_ranges" {
  type    = list(string)
  description = "source IP address range to which the firewall has to be applied"
}