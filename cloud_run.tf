module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  count    = length(var.run_regions)
  version = "0.2.0"
  service_name           = "myservice-run-app-${var.run_regions[count.index]}"
  project_id             = var.project
  location               = var.run_regions[count.index]
  image                  = var.image_name
  ports = var.container_port
  generate_revision_name = true
  members = ["allUsers"]
  template_annotations = { "autoscaling.knative.dev/maxScale": 4, 
                  "autoscaling.knative.dev/minScale": 1, 
                  "generated-by": "terraform", 
                  "run.googleapis.com/cloudsql-instances" = module.sql-db_postgresql.instance_connection_name
                  "run.googleapis.com/client-name": "terraform" }
  env_vars = [
    {
      name = "TASKCAFE_MIGRATE"
      value = var.deploy_db
    }, 
    {
      name = "TASKCAFE_SERVER_HOSTNAME"
      value = var.TASKCAFE_SERVER_HOSTNAME
    }, 
    {
    name = "TASKCAFE_DATABASE_HOST"
    value = "/cloudsql/${module.sql-db_postgresql.instance_connection_name}"
  } ]
  env_secret_vars = [{
    name = "TASKCAFE_DATABASE_NAME"
    value_from = [
      {
        secret_key_ref = {"key" = "latest", name = "dbnamesecret"}
      }
     ]
  },
  {
    name = "TASKCAFE_DATABASE_USER"
    value_from = [
      {
        secret_key_ref = {"key" = "latest", name = "dbusersecret"}
      }
     ]
  },
  {
    name = "TASKCAFE_DATABASE_PASSWORD"
    value_from = [
      {
        secret_key_ref = {"key" = "latest", name = "dbpasssecret"}
      }
     ]
  }]
}