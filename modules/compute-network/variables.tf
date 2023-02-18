variable "network_name" {
  type              = string
  description       = "name of the virtual private cloud network"
}

variable "auto_create_subnet" {
  type              = bool
  description       = "option to auto create the subnetwork"
}

variable "max_transmission_unit" {
  type              = number
  description       = "Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes"
}

variable "route_mode" {
  type              = string
  description       = "The network-wide routing mode to use - REGIONAL / GLOBAL"
}