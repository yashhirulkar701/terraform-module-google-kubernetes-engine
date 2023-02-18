
resource "google_container_node_pool" "gke-node-pool" {
  name       = var.node_pool_name
  cluster    = var.gke_cluster_id
  node_count = var.node-count 
  location   = var.gke_cluster_location

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size
    disk_type    = var.node_disk_type

    # labels = {
    #  role = "general"
    # }

    service_account = var.gke_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}