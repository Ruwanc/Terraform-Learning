output "alb_dns_name" {
  value       = aws_lb.web-server-lb.dns_name
  description = "DNS of the LB"
}