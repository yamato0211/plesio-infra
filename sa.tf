module "my-app-workload-identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name       = "${var.env_name}-sa"
  namespace  = "default"
  project_id = var.gcp_project_id
  roles      = ["roles/cloudsql.client"]
}

# GKE クラスターのサービスアカウントを取得
data "google_service_account" "gke_service_account" {
  project    = var.gcp_project_id
  account_id = module.gke.service_account
}

# Artifact Registry リーダーロールを GKE クラスターのサービスアカウントに付与
resource "google_project_iam_binding" "artifact_registry_reader" {
  project = var.gcp_project_id
  role    = "roles/artifactregistry.reader"

  members = [
    "serviceAccount:${data.google_service_account.gke_service_account.email}",
  ]
}
