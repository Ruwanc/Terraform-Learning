# variable "backend-s3-bucket-name" {
#   description = "Name of the s3 bucket which is using for backend configuration"
#   type        = string
#   default     = "terraform-up-and-running-state-rc-25mar2025"

variable "server_port" {
  description = "webserver port"
  type        = number
  default     = 80
}