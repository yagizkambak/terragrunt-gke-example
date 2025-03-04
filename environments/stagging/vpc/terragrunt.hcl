terraform {
  source = "../../../modules/vpc"
}

include {
  path = find_in_parent_folders("stagging.hcl")
}

remote_state {
  backend = "gcs"
  config = {
    bucket      = "example-terragrunt-bucket"
    prefix      = "terraform/states/stagging/vpc"
    # If you want to use a service account key file, uncomment the following line:
    # credentials = "/path/to/service-account-key.json"
  }
}

inputs = {
  network_name     = "example-staging-vpc"
  subnetwork_name  = "example-staging-subnet"
  subnetwork_cidr  = "10.3.0.0/16" 
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