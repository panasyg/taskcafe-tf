resource "google_project_service" "secretmanager_api" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "sqladmin_api" {
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudrun_api" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "run_api" {
  provider                   = google-beta
  service                    = "run.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}