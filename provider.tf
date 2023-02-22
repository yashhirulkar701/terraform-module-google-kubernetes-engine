terraform {
 backend "gcs" {
   bucket  = "tfstate-gcp-bucket"
   prefix  = "terraform/state"
 }
}
provider "google" {
    project     = var.project_id
    region      = var.gcp_region_name
}