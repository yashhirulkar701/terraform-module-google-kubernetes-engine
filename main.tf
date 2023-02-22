module "network" {
  source                            = "./modules/compute-network"
  network_name                      = "${var.gcp_region_name}-compute-network"
  auto_create_subnet                = false
  max_transmission_unit             = 1460
  route_mode                        = "REGIONAL"
}

locals {
  net_subnets                = cidrsubnets(var.network_cidr_block, 2,2,2,2)
  sec_subnet_cidr1           = cidrsubnets(var.secondary_ip_cidr1, 2,2,2,2)
  sec_subnet_cidr2           = cidrsubnets(var.secondary_ip_cidr2, 2,2,2,2)
}

module "public-subnetwork" {
  source                            = "./modules/compute-subnetwork"
  depends_on                        = [module.network]
  subnet_name                       = "public-subnet"
  subnet_cidr                       = local.net_subnets[0]
  subnet_region                     = var.gcp_region_name
  pip_google_access                 = false
  network_id                        = module.network.network_id_out
  sec_ip_range_name1                = "k8s-pod-range"
  sec_ip_cidr_range1                = local.sec_subnet_cidr1[0]
  sec_ip_range_name2                = "k8s-service-range"
  sec_ip_cidr_range2                = local.sec_subnet_cidr2[0]
}

module "private-subnetwork" {
  source                            = "./modules/compute-subnetwork"
  count                             = 3
  depends_on                        = [module.network]
  subnet_name                       = "private-subnet-${count.index +1}"
  subnet_cidr                       = local.net_subnets[count.index + 1]
  subnet_region                     = var.gcp_region_name
  pip_google_access                 = true
  network_id                        = module.network.network_id_out
  sec_ip_range_name1                = "k8s-pod-range"
  sec_ip_cidr_range1                = local.sec_subnet_cidr1[count.index + 1]
  sec_ip_range_name2                = "k8s-service-range"
  sec_ip_cidr_range2                = local.sec_subnet_cidr2[count.index + 1]
}

module "compute_firewall" {
  source                            = "./modules/compute-firewall"
  depends_on                        = [module.network]
  firewall_name                     = "${var.gcp_region_name}-firewall"
  network_name                      = module.network.network_name_out
  tcp_ports                         = var.tcp_firewall_ports
  udp_ports                         = var.udp_firewall_ports
  source_ranges                     = var.firewall_source_ranges 
}

module "router" {
  source                            = "./modules/compute-router"
  depends_on                        = [module.network, module.private-subnetwork]
  router_name                       = "${var.gcp_region_name}-router"
  network_id                        = module.network.network_id_out
  bgp_asn                           = "65000"
  router_region                     = var.gcp_region_name
}

module "nat" {
  source                            = "./modules/cloud-nat"
  depends_on                        = [module.router]
  nat_name                          = "${var.gcp_region_name}-nat"
  router_name                       = module.router.router_name_out
  router_region                     = module.router.router_region_out
  nat_ip_allocation                 = "AUTO_ONLY"
  source_subnet_ip_ranges_to_nat    = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  logs                              = true
  log_filter                        = "ERRORS_ONLY"
}

module "gke-cluster" {
  source                             = "./modules/gke"
  cluster_name                       = "${var.gcp_region_name}-gke-cluster"
  cluster_location                   = var.gke_cluster_location
  gke_node_location                  = var.gke_node_pool_location
  cluster_network                    = module.network.network_id_out
  cluster_subnetwork                 = module.private-subnetwork.*.subnetwork_name_out[0]
  gke_log_service                    = "logging.googleapis.com/kubernetes"
  gke_monitoring_service             = "monitoring.googleapis.com/kubernetes"
  private_cluster                    = true
  enable_private_gke_endpoint        = true
  #if you have a vpn setup to connect to GKE cluster set above option (enable_private_endpoint) to true, else false. Also, Master authorized networks must be enabled if true. 
  master_auth_cidr                   = var.master-auth-cidr
  master_ipv4_cidr                   = var.gke_master_ipv4_cidr
  workload-pool                      = "${var.project_id}.svc.id.goog"
  cluster_sec_range_name             = "k8s-pod-range"
  services_sec_range_name            = "k8s-service-range"
}

module "gke-service-account" {
  source                             = "./modules/service-account"
  account-id                         = "kubernetes"
}

module "gke-node-pool" {
  source                             = "./modules/gke-node-pool"
  depends_on                         = [module.gke-cluster, module.gke-service-account]
  node_pool_name                     = "node-pool-${count.index + 1}"
  count                              = var.gke_node_pool_count
  gke_cluster_id                     = module.gke-cluster.gke_id_out
  gke_cluster_location               = var.gke_cluster_location
  gke_node_location                  = ["${element(var.gke_node_pool_location, count.index)}"]
  node-count                         = var.gke_node_count
  node_machine_type                  = var.gke_machine_type
  node_disk_size                     = var.gke_node_disk_size
  node_disk_type                     = var.gke_node_disk_type
  gke_service_account                = module.gke-service-account.sa_email_out
}

# module "gke-node-pool-2" {
#   source                             = "./modules/gke-node-pool"
#   node_pool_name                     = "node-pool-2"
#   gke_cluster_id                     = module.gke-cluster.gke_id_out
#   gke_cluster_location               = var.gke_node_pool2_location
#   node-count                         = var.gke_node_count
#   node_machine_type                  = var.gke_machine_type
#   node_disk_size                     = var.gke_node_disk_size
#   node_disk_type                     = var.gke_node_disk_type
#   gke_service_account                = module.gke-service-account.sa_email_out
# }

