# output "web_server_public_ip" {
#   value       = aws_instance.web.public_ip
#   description = "public ip of web server"
# }

output "alb_dns_name" {
  value       = aws_lb.web-server-lb.dns_name
  description = "DNS of the LB"
}