# 30-July-2025 Can Ignore commented ones since these copy & pasted from mysql module output file
# output "mysql_rds_db_address" {
#   value       = aws_db_instance.mysql_rds_db.address
#   description = "Connect to the database at this endpoint"
# }
# output "mysql_rds_db_port" {
#   value       = aws_db_instance.mysql_rds_db.port
#   description = "The port the database is listening on"
# }

# Define module output variable here
output "mysql_rds_db_address_from_module" {
  #value = module.<module_name_in_resource_definition>.<module_output_variable_name>
  value       = module.mysql_rds_instance_module.mysql_rds_db_address
  description = "Address of the MySQL RDS instance from the module"
}

output "mysql_rds_db_port_from_module" {
  value       = module.mysql_rds_instance_module.mysql_rds_db_port
  description = "Port of the MySQL RDS instance from the module"
}