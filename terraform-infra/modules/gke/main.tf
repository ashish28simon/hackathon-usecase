resource "google_container_cluster" "primary" {
  name               = "microservices-cluster-${var.env}"
  location           = var.region
  initial_node_count = 1

  remove_default_node_pool = true
  network                  = var.vpc_id
  subnetwork               = var.private_subnets[0]

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

output "kube_cluster_name" {
  value = google_container_cluster.primary.name
}

output "kube_endpoint" {
  value = google_container_cluster.primary.endpoint
}