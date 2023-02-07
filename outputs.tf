output "project_id" {
  description = "The project ID where app engine is created"
  value       = module.app-engine-project.project_id
}

output "app_name" {
  description = "Unique name of the app, usually apps/{PROJECT_ID}."
  value       = module.app-engine.name
}

output "default_hostname" {
  description = "The default hostname for this app."
  value       = module.app-engine.default_hostname
}

output "location_id" {
  description = "The location app engine is serving from"
  value       = module.app-engine.location_id
}
