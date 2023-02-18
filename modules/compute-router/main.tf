resource "google_compute_router" "router" {
  name        = var.router_name
  network     = var.network_id
  region      = var.router_region 
  bgp {
    asn       = var.bgp_asn
  }
}
