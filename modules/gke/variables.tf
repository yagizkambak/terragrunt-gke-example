variable "cluster_name" {
  description = "The name of the Cluster."
}
variable "region" {
  description = "The region to create the network in."
}
variable "zone" {
  description = "The region to create the network in."
}
variable "node_count" {
  description = "value of node count"
}
variable "machine_type" {
  description = "value of machine type"
}
variable "node_pool_name" {
  description = "value of node pool name"
}
variable "disk_size_gb" {
  description = "value of disk size in GB"
}
variable "deletion_protection" {
  description = "value to enable deletion protection"
}
variable "network_id" {
  description = "value of network id"
}
variable "subnetwork_id" {
  description = "value of subnetwork id"
}
variable "project_id" {
  description = "The project ID to deploy resources"
}
variable "initial_node_count" {
  description = "The initial number of nodes that the cluster should create"
}
variable "disk_type" {
  description = "value of disk type for the node pool"
}
variable "preemptible" {
  description = "value of preemptible nodes"
}
variable "release_channel" {
  description = "The release channels allow organizations to better set their expectation of what is stable. GKE’s release channel options include rapid, regular, and stable. This allows you to opt for the alpha releases as part of the rapid option, regular for standard release needs and stable when the tried-and-tested version becomes available."
}
variable "intranode_visiable" {
  description = "Enable VPC Flow Logs and Intranode Visibility to see pod-level traffic, even for traffic within a worker node. With this feature, you can use VPC Flow Logs or other VPC features for intranode traffic."
}
variable "env" {
  description = "The environment to deploy the resources"
}
