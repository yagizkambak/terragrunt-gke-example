# VPC Netowrk
output "description" {
  value = google_compute_network.vpc_network.description
}
output "id" {
  value = google_compute_network.vpc_network.id
}
output "network_id" {
  value = google_compute_network.vpc_network.network_id
}
output "vpc_address" {
  value = google_compute_network.vpc_network.self_link
}

# Subnetwork
output "subnetwork_id" {
  value = google_compute_subnetwork.subnetwork.subnetwork_id
}
output "subnetwork_description" {
  value = google_compute_subnetwork.subnetwork.description
}
output "ip_cidr_range" {
  value = google_compute_subnetwork.subnetwork.ip_cidr_range
}
output "gateway_address" {
  value = google_compute_subnetwork.subnetwork.gateway_address  
}
output "private_ip_google_access" {
  value = google_compute_subnetwork.subnetwork.private_ip_google_access
}
output "secondary_ip_range" {
  value = google_compute_subnetwork.subnetwork.secondary_ip_range 
}

