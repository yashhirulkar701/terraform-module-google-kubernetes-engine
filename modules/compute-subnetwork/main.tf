resource "google_compute_subnetwork" "compute_subnetwork" {
  name                      = var.subnet_name
  ip_cidr_range             = var.subnet_cidr
  region                    = var.subnet_region
  network                   = var.network_id
  private_ip_google_access  = var.pip_google_access
  
  secondary_ip_range {
    range_name    = var.sec_ip_range_name1 #"k8s-pod-range"
    ip_cidr_range = var.sec_ip_cidr_range1 #"10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = var.sec_ip_range_name2 #"k8s-service-range"
    ip_cidr_range = var.sec_ip_cidr_range2 #"10.52.0.0/20"
  }
}

