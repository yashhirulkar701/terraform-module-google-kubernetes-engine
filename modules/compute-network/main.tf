resource "google_compute_network" "compute_network" {
  name                        = var.network_name
  auto_create_subnetworks     = var.auto_create_subnet
  mtu                         = var.max_transmission_unit
  routing_mode                = var.route_mode
}