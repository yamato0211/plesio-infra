provider "google" {
  credentials = file("./secret.json")

  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = "${var.gcp_region}-a"
}

provider "google-beta" {
  credentials = file("./secret.json")

  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = "${var.gcp_region}-a"
}
