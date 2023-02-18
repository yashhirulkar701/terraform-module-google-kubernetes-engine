variable "gcp_region_name" {
  type                = string
  description         = "the GCP region in which infrastructure should be provisioned"
}

variable "project_id" {
  type                = string
  description         = "id of the project"
}

variable "network_cidr_block" {
  type                = string
  description         = "CIDR of the subnetwork"
}

variable "secondary_ip_cidr1" {
  type                = string
  description         = "CIDR for secondary ip of subnetwork for k8s pods"
}

variable "secondary_ip_cidr2" {
  type                = string
  description         = "CIDR for secondary ip of subnetwork for k8s service"
}

variable "firewall_ports" {
  type                = list(string)
  description         = "list of the tcp ports to be enabled"
}

variable "firewall_source_ranges" {
  type                = list(string)
  description         = "source IP address range to which the firewall has to be applied"
}

variable "gke_location" {
  type                = string
  description         = "the GCP region/zone in which GKE should be provisioned"
}


variable "gke_master_ipv4_cidr" {
  type                = string
  description         = "The IP range in CIDR notation to use for the hosted master network, and it must be a /28 subnet."
}

variable "gke_node_pool_count" {
  type                = string
  description         = "count of node pools in GKE pool"
}

variable "gke_node_count" {
  type                = string
  description         = "count of nodes in node pool"
}

variable "gke_machine_type" {
  type                = string
  description         = "machine type of the node"
}

variable "gke_node_disk_size" {
  type                = string
  description         = "disk size of the node machine in gb"
}

variable "gke_node_disk_type" {
  type                = string
  description         = "disk type of the node machine"
}

