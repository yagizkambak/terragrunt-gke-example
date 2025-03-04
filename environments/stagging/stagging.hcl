locals {
  region = "us-east1"
  zone = "us-east1-b"
  environment = "stagging"
  project_id = "<<your-gcp-project-id>>"
  env = "stagging"
}

inputs = {
  region      = local.region
  zone        = local.zone
  environment = local.environment
  project_id  = local.project_id
  env         = local.env
}
