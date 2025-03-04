terraform {
  source = "../../../modules/gke"
}

include {
  path = find_in_parent_folders("stagging.hcl")
}

remote_state {
  backend = "gcs"
  config = {
    bucket      = "example-terragrunt-bucket"
    prefix      = "terraform/states/stagging/gke"
    # If you want to use a service account key file, uncomment the following line:
    # credentials = "/path/to/service-account-key.json"
  }
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    network_id = "mock-network-id"
    subnetwork_id = "mock-network-id"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate" , "init"]
}

inputs = {
  cluster_name        = "example-stagging-cluster"
  deletion_protection = false
  initial_node_count  = "1"
  node_count          = "2"
  machine_type        = "n2-standard-2"
  node_pool_name      = "example-stagging-pool"
  disk_size_gb        = "30"
  disk_size           = "30"
  disk_type           = "pd-standard"
  preemptible         = true
  subnetwork_id       = dependency.vpc.outputs.subnetwork_id
  network_id          = dependency.vpc.outputs.network_id
  release_channel     = "REGULAR"
  intranode_visiable  = true
  env                 = "stagging"
}
