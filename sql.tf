resource "google_sql_database_instance" "mysql" {
  project          = var.gcp_project_id
  name             = "mysql-${var.env_name}"
  region           = "asia-northeast1"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = module.vpc.network_id
    }
  }
}

resource "google_sql_user" "users" {
  project = var.gcp_project_id

  name     = var.db_user
  instance = google_sql_database_instance.mysql.name
  password = var.db_password
}

resource "google_sql_database" "database" {
  project = var.gcp_project_id

  name     = var.db_name
  instance = google_sql_database_instance.mysql.name
}