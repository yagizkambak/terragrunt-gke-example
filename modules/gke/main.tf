# Description: This file contains the terraform configuration to create a GKE cluster and node pool.
# If you use GCS as a backend, you can store the terraform state file in a GCS bucket.
terraform {
    backend "gcs" {}
}

resource "google_container_cluster" "example-cluster" {
  name                        = var.cluster_name
  location                    = var.zone
  remove_default_node_pool    = true
  initial_node_count          = var.initial_node_count
  deletion_protection         = var.deletion_protection
  network                     = var.network_id
  subnetwork                  = var.subnetwork_id
  enable_intranode_visibility = var.intranode_visiable

  network_policy {
    enabled = true
  }
  release_channel {
    channel = var.release_channel
  }
  resource_labels = {
    environment = var.env
  }
}

resource "google_container_node_pool" "example-node-pool" {
  name       = var.node_pool_name
  location   = var.zone
  cluster    = google_container_cluster.example-cluster.name
  node_count = var.node_count

  node_config {
    preemptible  = var.preemptible
    disk_size_gb = var.disk_size_gb
    machine_type = var.machine_type
    disk_type    = var.disk_type
  }
}