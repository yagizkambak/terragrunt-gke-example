locals {
  region = "us-west1"
  zone = "us-west1-b"
  environment = "development"
  project_id = "<<your-gcp-project-id>>"
  env = "development"
}

inputs = {
  region      = local.region
  zone        = local.zone
  environment = local.environment
  project_id  = local.project_id
  env         = local.env
}
