output "endpoint" {
  value = google_container_cluster.example-cluster.endpoint
}

output "cluster_name" {
  value = google_container_cluster.example-cluster.name
}

output "location" {
  value = google_container_cluster.example-cluster.location 
}

output "project" {
  value = google_container_cluster.example-cluster.project
}

output "release_channel" {
  value = google_container_cluster.example-cluster.release_channel
}

output "cluster_link" {
  value = google_container_cluster.example-cluster.self_link
}

data "google_client_config" "default" {}
resource "local_file" "kubeconfig" {
  content  = <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${google_container_cluster.example-cluster.master_auth[0].cluster_ca_certificate}
    server: https://${google_container_cluster.example-cluster.endpoint}
  name: ${google_container_cluster.example-cluster.name}
contexts:
- context:
    cluster: ${google_container_cluster.example-cluster.name}
    user: gke-user
  name: ${google_container_cluster.example-cluster.name}
current-context: ${google_container_cluster.example-cluster.name}
kind: Config
preferences: {}
users:
- name: gke-user
  user:
    token: "${data.google_client_config.default.access_token}"
EOF

  filename = "${path.module}/kubeconfig.yaml"
}

output "kubeconfig_path" {
  value = "${path.module}/kubeconfig.yaml"
  description = "You can find the kubeconfig file for the GKE cluster at this path."
}