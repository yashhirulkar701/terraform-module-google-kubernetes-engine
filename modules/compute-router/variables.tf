variable "router_name" {
  type                = string
  description         = "name of the cloud router"
}

variable "router_region" {
  type                = string
  description         = "region of the cloud router"
}

variable "network_id" {
  type                = string
  description         = "id of compute network to be connected with cloud router"
}

variable "bgp_asn" {
  type                = number
  description         = "Local BGP Autonomous System Number"
}