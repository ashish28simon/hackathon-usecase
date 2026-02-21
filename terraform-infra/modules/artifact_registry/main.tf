resource "google_artifact_registry_repository" "docker_repo" {
  name        = "microservices-repo-${var.env}"
  format      = "DOCKER"
  location    = var.region
  description = "Docker repo for microservices images"
}

output "repo_name" {
  value = google_artifact_registry_repository.docker_repo.name
}