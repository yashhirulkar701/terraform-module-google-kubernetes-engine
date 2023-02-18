resource "google_compute_firewall" "firewall" {
  name              = var.firewall_name
  network           = var.network_name
  allow {
    protocol        = "icmp"
  }
  allow {
    protocol        = "tcp"
    ports           = var.tcp_ports
  }
  source_ranges     = var.source_ranges 
}
