resource "google_artifact_registry_repository" "plesio-repository" {
  location      = var.gcp_region
  repository_id = "${var.gcp_project_id}-repository"
  description   = "plesio docker repository"
  format        = "DOCKER"
}