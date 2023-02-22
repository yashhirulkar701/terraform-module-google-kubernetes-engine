gcp_region_name                = "europe-west3" #Francrut
project_id                     = "engaged-beaker-378408"
network_cidr_block             = "10.0.0.0/18"
secondary_ip_cidr1             = "10.48.0.0/12"
secondary_ip_cidr2             = "20.52.0.0/18"
tcp_firewall_ports             = ["443", "22"]
udp_firewall_ports             = ["10000-19999"]
firewall_source_ranges         = ["0.0.0.0/0"]
gke_master_ipv4_cidr           = "172.16.0.0/28"
gke_node_pool_count            = 2
gke_node_count                 = 1
gke_machine_type               = "e2-standard-2"
gke_node_disk_size             = "50"
gke_node_disk_type             = "pd-balanced"
master-auth-cidr               = "10.0.0.0/18" 
gke_cluster_location           = "europe-west3"
gke_node_pool_location         = ["europe-west3-a","europe-west3-b","europe-west3-c"]



