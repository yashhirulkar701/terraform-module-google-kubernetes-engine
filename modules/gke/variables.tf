variable "cluster_name" {
  type              = string
  description       = "Name of the cluster"
}

variable "cluster_location" {
  type              = string
  description       = "Location of the Cluster"
}
variable "cluster_network" {
  type              = string
  description       = "Network of the cluster"
}
variable "cluster_subnetwork" {
  type              = string
  description       = "Subnetwork of the cluster"
}
variable "gke_log_service" {
  type              = string
  description       = "The logging service that the cluster should write logs to"
}
variable "gke_monitoring_service" {
  type              = string
  description       = "The monitoring service that the cluster should write metrics to"
}
variable "private_cluster" {
  type              = bool
  description       = "Enables the private cluster feature, creating a private endpoint on the cluster"
}
variable "enable_private_gke_endpoint" {
  type              = bool
  description       = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled. When false, either endpoint can be used. This field only applies to private clusters, when enable_private_nodes is true"
}
variable "master_ipv4_cidr" {
  type              = string
  description       = "The IP range in CIDR notation to use for the hosted master network, and it must be a /28 subnet."
}

variable "workload-pool" {
  type              = string
  description       = "The workload pool to attach all Kubernetes service accounts to."
}

variable "cluster_sec_range_name" {
  type              = string
  description       = "secondary cluster ip range name"
}

variable "services_sec_range_name" {
  type              = string
  description       = "secondary services ip range name"
}
