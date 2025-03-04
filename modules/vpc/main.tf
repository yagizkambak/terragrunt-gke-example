# Purpose: Create a VPC network, subnetwork, and firewall rules
# If you use GCS as a backend, you can store the terraform state file in a GCS bucket.
terraform {
  backend "gcs" {}
}

resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  description = "VPC network for the ${var.env} environment"
}

resource "google_compute_firewall" "default" {
  name        = "${var.env}-gke-firewall"
  network     = google_compute_network.vpc_network.name
  source_tags = ["example"]
  
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_subnetwork" "subnetwork" {
  name                      = var.subnetwork_name
  ip_cidr_range             = var.subnetwork_cidr
  region                    = var.region
  network                   = google_compute_network.vpc_network.id
  private_ip_google_access  = true
  description = "Subnetwork for the ${var.env} environment"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
