variable "subnet_name" {
  type              = string
  description       = "name of the subnetwork"
}

variable "subnet_cidr" {
  type              = string
  description       = "CIDR of the subnetwork"
}

variable "subnet_region" {
  type              = string
  description       = "region in which the subnetwork has to created"
}

variable "network_id" {
  type              = string
  description       = "id of the network to which subnetwork has to be associated"
}

variable "pip_google_access" {
  type              = bool
  description       = "option to enable VM's in this subnetwork to access Google APIs and services without external IP"
}

variable "sec_ip_range_name1" {
  type              = string
  description       = "name of the first secondary ip range"
}

variable "sec_ip_cidr_range1" {
  type              = string
  description       = "cidr of the first secondary ip range"
}

variable "sec_ip_range_name2" {
  type              = string
  description       = "name of the second secondary ip range"
}
variable "sec_ip_cidr_range2" {
  type              = string
  description       = "cidr of the second secondary ip range"
}