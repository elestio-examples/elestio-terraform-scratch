resource "elestio_postgresql" "pg_service" {
  project_id    = elestio_project.pg_project.id
  server_name   = "pg-service"
  server_type   = "SMALL-1C-2G"
  provider_name = "hetzner"
  datacenter    = "fsn1"
  support_level = "level1"
  admin_email   = var.elestio_email
}
