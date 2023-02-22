
resource "google_container_cluster" "primary-cluster" {
  name                     = var.cluster_name 
  location                 = var.cluster_location
  node_locations           = var.gke_node_location
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.cluster_network
  subnetwork               = var.cluster_subnetwork
  logging_service          = var.gke_log_service 
  monitoring_service       = var.gke_monitoring_service 
  networking_mode          = "VPC_NATIVE"

  master_authorized_networks_config {
    
    cidr_blocks {
       cidr_block = var.master_auth_cidr
       display_name = "internal"
     }
   }
  
  cluster_autoscaling {
    enabled = false
  }

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "STABLE"
  }

  workload_identity_config {
    workload_pool = var.workload-pool 
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_sec_range_name #"k8s-pod-range"
    services_secondary_range_name = var.services_sec_range_name #"k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = var.private_cluster
    enable_private_endpoint = var.enable_private_gke_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr 
  }
  
}

