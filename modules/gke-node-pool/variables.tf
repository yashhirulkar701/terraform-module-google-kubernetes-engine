variable "node_pool_name" {
  type              = string
  description       = "Name of the gke node pool" 
}

variable "gke_cluster_id" {
  type              = string
  description       = "cluster id of the GKE"
}

variable "gke_cluster_location" {
  type              = string
  description       = "cluster location of the GKE"
}

variable "gke_node_location" {
  type              = list(string)
  description       = "Location of the node pool"
}

variable "node-count" {
  type              = string
  description       = "count of nodes in node pool"
}

variable "node_machine_type" {
  type              = string
  description       = "machine type of the node"
}

variable "node_disk_size" {
  type              = string
  description       = "disk size of the node machine in gb"
}

variable "node_disk_type" {
  type              = string
  description       = "disk type of the node machine"
}

variable "gke_service_account" {
  type              = string
  description       = "service account for gke"
}
