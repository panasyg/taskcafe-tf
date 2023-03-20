resource "google_sourcerepo_repository" "repo" {
  name = "repository-${var.name}"
}

resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  count = length(var.run_regions)
  description = "Cloud Source Repository Trigger ${var.repository_name} (${var.branch_name})"

  trigger_template {
    branch_name = var.branch_name
    repo_name   = google_sourcerepo_repository.repo.name
  }

  substitutions = {
    _LOCATION     = var.run_regions[count.index]
    _GCR_REGION   = var.gcr_region[count.index]
    _SERVICE_NAME = module.cloud_run[count.index].service_name
  }

  filename = "cloudbuild.yaml"
  depends_on = [google_sourcerepo_repository.repo]
}
