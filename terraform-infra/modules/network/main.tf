resource "google_compute_network" "vpc" {
  project = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  project = var.project_id
  count         = length(var.public_subnet_cidrs)
  name          = "public-${count.index}-${var.env}"
  ip_cidr_range = var.public_subnet_cidrs[count.index]
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private" {
  project = var.project_id
  count         = length(var.private_subnet_cidrs)
  name          = "private-${count.index}-${var.env}"
  ip_cidr_range = var.private_subnet_cidrs[count.index]
  region        = var.region
  network       = google_compute_network.vpc.id
}

output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "public_subnets" {
  value = google_compute_subnetwork.public[*].id
}

output "private_subnets" {
  value = google_compute_subnetwork.private[*].id
}
