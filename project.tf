resource "elestio_project" "pg_project" {
  name             = "PostgreSQL Project"
  description      = "Contains a postgres database"
  technical_emails = var.elestio_email
}
