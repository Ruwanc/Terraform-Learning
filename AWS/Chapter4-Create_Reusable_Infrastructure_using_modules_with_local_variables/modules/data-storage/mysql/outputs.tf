# output "address" {
#   value       = aws_db_instance.mysql_rds_db.address
#   description = "Connect to the database at this endpoint"
# }
# output "port" {
#   value       = aws_db_instance.mysql_rds_db.port
#   description = "The port the database is listening on"
# }

## added on 29-july-2025
# output "mysql_rds_db_datasource" {
#   value       = module.mysql_rds_db.resource_id
#   description = "MySQL RDS DB datasource"
# }

# 30-July-2025
output "mysql_rds_db_address" {
  value       = aws_db_instance.mysql_rds_db.address
  description = "Connect to the database at this endpoint"
}
output "mysql_rds_db_port" {
  value       = aws_db_instance.mysql_rds_db.port
  description = "The port the database is listening on"
}