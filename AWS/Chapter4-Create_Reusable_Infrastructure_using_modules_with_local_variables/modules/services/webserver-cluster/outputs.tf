output "alb_dns_name" {
  value       = aws_lb.web-server-lb.dns_name
  description = "DNS of the LB"
}

output "webserver-auto-scaling-group-name" {
  value       = aws_autoscaling_group.webserver-asg.name
  description = "Name of the webserver auto scaling group"
}