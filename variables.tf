variable "org_id" {
  description = "The organization ID."
  type        = string
}

variable "folder_id" {
  description = "The ID of a folder to host this project."
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}