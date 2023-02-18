variable "router_name" {
  type              = string
  description       = "name of the cloud router"
}

variable "router_region" {
  type              = string
  description       = "region of the cloud router"
}

variable "nat_name" {
  type              = string
  description       = "name of the cloud NAT"
}

variable "nat_ip_allocation" {
  type              = string
  description       = "how external IPs should be allocated for this NAT. values - MANUAL_ONLY / AUTO_ONLY"
}

variable "source_subnet_ip_ranges_to_nat" {
  type              = string
  description       = "how NAT should be configured per Subnetwork. values - ALL_SUBNETWORKS_ALL_IP_RANGES / ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES / LIST_OF_SUBNETWORKS"
}

variable "logs" {
  type              = bool
  description       = "to enable the logging on NAT"
}

variable "log_filter" {
  type              = string
  description       = "specifies the desired filtering of logs on this NAT. values - ERRORS_ONLY / TRANSLATIONS_ONLY / ALL"
}