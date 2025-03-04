variable "network_name" {
  description = "The name of the VPC network."
}
variable "subnetwork_name" {
  description = "The name of the subnetwork."
}
variable "subnetwork_cidr" {
  description = "The CIDR block for the subnetwork."
}
variable "region" {
  description = "The region to create the network in."
}
variable "project_id" {
  description = "The project ID to deploy resources"
}
variable "env" {
  description = "The environment to deploy resources"
}