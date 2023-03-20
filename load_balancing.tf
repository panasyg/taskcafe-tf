resource "google_compute_region_network_endpoint_group" "default" {
  provider              = google-beta
  count                 = length(var.run_regions)
  name                  = "myservice-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.run_regions[count.index]
  cloud_run {
    service = module.cloud_run[count.index].service_name
  }
}

module "lb-http" {
  source            = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version = "7.0.0"
  project = var.project
  name    = "${var.name}-def"

  ssl                             = false
  managed_ssl_certificate_domains = []
  https_redirect                  = false
  backends = {
    default = {
      description            = null
      enable_cdn             = false
      custom_request_headers = null
      compression_mode = null
      custom_response_headers = null
      port_name = null
      protocol = null

      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        for neg in google_compute_region_network_endpoint_group.default:
        {
          group = neg.id
        }
      ]

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
      security_policy = null
    }
  }
}