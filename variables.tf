
variable "TASKCAFE_SERVER_HOSTNAME" {
  description = "Run load balancer on HTTPS and provision managed certificate with provided `domain`."
  type        = string
  default     = "0.0.0.0:8080"
}

variable "container_port" {
  description = "The name of the image to deploy. Defaults to a publically available image."
  type        = object({ 
    name = string 
    port = number })
  default = { "name": "http1", "port": 8080 }
}

variable "run_regions" {
  type    = list(string)
  default = ["us-central1", "europe-west1" ]
}

variable "gcr_region" {
  type        = list(string)
  default = ["us", "eu"]
}

variable "project" {
  description = "The project ID where all resources will be launched."
  type        = string
}

variable "location" {
  description = "The location (region or zone) to deploy the Cloud Run services. Note: Be sure to pick a region that supports Cloud Run."
  type        = string
}

variable "name" {
  description = "The name of the Redis"
  type        = string
  default     = "taskcafe"
}

variable "repository_name" {
  description = "Name of the Google Cloud Source Repository to create."
  type        = string
  default     = "taskcafe-app"
}

variable "image_name" {
  description = "The name of the image to deploy. Defaults to a publically available image."
  type        = string
  default     = "gcr.io/google-samples/zone-printer:0.2"
}

variable "branch_name" {
  description = "Example branch name used to trigger builds."
  type        = string
  default     = "master"
}

variable "digest" {
  description = "The docker image digest or tag to deploy."
  type        = string
  default     = "latest"
}

variable "deploy_db" {
  description = "Whether to deploy a Cloud SQL database or not."
  type        = bool
  default     = true
}

variable "database_version" {
  description = "The name of the Cloud SQL database."
  type        = string
  default     = "POSTGRES_14"
}

variable "db_name" {
  description = "The name of the Cloud SQL database."
  type        = string
  default     = "taskcafe"
}

variable "db_username" {
  description = "The name of the Cloud SQL database user."
  type        = string
  default     = "taskcafe"
}

variable "db_password" {
  description = "The password of the Cloud SQL database user."
  type        = string
  default     = "taskcafe_test"
}

