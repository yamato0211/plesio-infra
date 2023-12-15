resource "google_compute_global_address" "static_ip" {
  name    = "plesio-static-ip-${var.env_name}"
  project = var.gcp_project_id
}

resource "google_compute_global_address" "argo_static_ip" {
  name    = "argo-static-ip-${var.env_name}"
  project = var.gcp_project_id
}
