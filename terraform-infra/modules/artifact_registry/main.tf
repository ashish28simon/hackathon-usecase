resource "google_artifact_registry_repository" "docker_repo" {
  location      = var.region
  project = var.project_id
  repository_id = var.repository_id
  format        = "DOCKER"
}

output "repo_name" {
  value = google_artifact_registry_repository.docker_repo.name
}
