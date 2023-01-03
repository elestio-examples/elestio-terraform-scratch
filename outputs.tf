output "pg_service_psql_command" {
  value       = elestio_postgresql.pg_service.database_admin.command
  description = "The PSQL command to connect to the database."
  sensitive   = true
}
