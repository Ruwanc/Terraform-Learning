output "alb_dns_name" {
  value       = aws_lb.web-server-lb.dns_name
  description = "DNS of the LB"
}

output "webserver-auto-scaling-group-name" {
  value       = aws_autoscaling_group.web-server-autoscaling-group.name
  description = "Name of the webserver auto scaling group"
}

#29-July-2025 added
# output "mysql_db_address" {
#   value       = module.mysql_rds_db.address
#   description = "Address of the MySQL RDS instance"
# }

# output "mysql_db_port" {
#   value       = module.mysql_rds_db.port
#   description = "port of the MySQL RDS instance"
# }