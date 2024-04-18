terraform {
  required_providers {
    elestio = {
      source  = "elestio/elestio"
      version = ">= 0.17.0" # check out the latest version available
    }
  }
}

# Configure the Elestio Provider with your credentials
provider "elestio" {
  email     = var.elestio_email
  api_token = var.elestio_api_token
}

# Create a Project
resource "elestio_project" "my_project" {
  name             = "from-scratch"
  technical_emails = var.elestio_email
}

# Create a PostgreSQL Service
resource "elestio_postgresql" "my_service" {
  project_id       = elestio_project.my_project.id
  provider_name    = "hetzner"
  datacenter       = "fsn1"
  server_type      = "SMALL-1C-2G"
  firewall_enabled = true
}

# Output the command that can be used to connect to the database
output "pg_service_psql_command" {
  value       = elestio_postgresql.my_service.database_admin.command
  description = "The PSQL command to connect to the database."
  sensitive   = true
}
