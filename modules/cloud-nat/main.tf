resource "google_compute_router_nat" "nat" {
  name                                  = var.nat_name
  router                                = var.router_name
  region                                = var.router_region
  nat_ip_allocate_option                = var.nat_ip_allocation
  source_subnetwork_ip_ranges_to_nat    = var.source_subnet_ip_ranges_to_nat

  log_config {
    enable                              = var.logs
    filter                              = var.log_filter
  }
}