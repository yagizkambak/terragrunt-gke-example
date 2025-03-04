terraform {
  source = "../../../modules/vpc"
}

remote_state {
  backend = "gcs"
  config = {
    bucket      = "<<your-gcp-bucket-name>>"
    prefix      = "terraform/states/development/vpc"
    # If you want to use a service account key file, uncomment the following line:
    # credentials = "/path/to/service-account-key.json"
  }
}

include {
  path = find_in_parent_folders("development.hcl")
}

inputs = {
  network_name    = "example-dev-vpc"
  subnetwork_name = "example-dev-subnet"
  subnetwork_cidr = "10.1.0.0/24"
}

generate "outputs" {
  path      = "outputs.tf"
  if_exists = "overwrite"
  contents  = <<EOF
output "subnetwork_id" {
  value = google_compute_subnetwork.subnetwork.id
}
output "network_id" {
  value = google_compute_network.vpc_network.id
}
EOF
}