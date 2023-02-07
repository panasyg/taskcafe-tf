resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

module "app-engine-project" {
  source            = "../../"
  name              = "appeng-${random_string.suffix.result}"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = var.folder_id
  billing_account   = var.billing_account
  activate_apis = [
    "appengine.googleapis.com",
  ]
}

module "app-engine" {
  source      = "../../modules/app_engine"
  project_id  = module.app-engine-project.project_id
  location_id = "us-east4"
}