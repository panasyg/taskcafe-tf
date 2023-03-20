resource "google_secret_manager_secret" "dbuser" {
  secret_id = "dbusersecret"
  replication {
    automatic = true
  }
  depends_on = [google_project_service.secretmanager_api]
}

resource "google_secret_manager_secret_version" "dbuser_data" {
  secret      = google_secret_manager_secret.dbuser.id
  secret_data = var.db_username
}

resource "google_secret_manager_secret_iam_member" "secretaccess_compute_dbuser" {
  secret_id = google_secret_manager_secret.dbuser.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_secret_manager_secret" "dbpass" {
  secret_id = "dbpasssecret"
  replication {
    automatic = true
  }
  depends_on = [google_project_service.secretmanager_api]
}

resource "google_secret_manager_secret_version" "dbpass_data" {
  secret      = google_secret_manager_secret.dbpass.id
  secret_data = var.db_password
}

resource "google_secret_manager_secret_iam_member" "secretaccess_compute_dbpass" {
  secret_id = google_secret_manager_secret.dbpass.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_secret_manager_secret" "dbname" {
  secret_id = "dbnamesecret"
  replication {
    automatic = true
  }
  depends_on = [google_project_service.secretmanager_api]
}

resource "google_secret_manager_secret_version" "dbname_data" {
  secret      = google_secret_manager_secret.dbname.id
  secret_data = var.db_name
}

resource "google_secret_manager_secret_iam_member" "secretaccess_compute_dbname" {
  secret_id = google_secret_manager_secret.dbname.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com" 
}