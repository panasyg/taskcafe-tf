module "sql-db_postgresql" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "13.0.0"
  name = "${var.name}-db"
  database_version = var.database_version
  zone = "us-central1-a"
  project_id = var.project 
  db_name = var.db_name
  user_name = var.db_username
  user_password = var.db_password
  create_timeout = "30m"
  delete_timeout = "30m"
}