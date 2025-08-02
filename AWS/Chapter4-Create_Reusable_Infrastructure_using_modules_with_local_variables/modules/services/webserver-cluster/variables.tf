# variable "backend-s3-bucket-name" {
#   description = "Name of the s3 bucket which is using for backend configuration"
#   type        = string
#   default     = "terraform-up-and-running-state-rc-25mar2025"

variable "server_port" {
  description = "webserver port"
  type        = number
  default     = 80
}

##--------------------------------module input parameters start-------------------------------------
variable "web_server_cluster_name"{
  description = "Name of the web server cluster to use with all cluster resources"
  type        = string
}

# variable "mysql_db_remote_state_bucket" {
#   description = "Name of the s3 bucket which is using for backend configuration of mysql db"
#   type        = string
# }

# variable "mysql_db_remote_state_key" {
#   description = "Name of the key which is using for backend configuration of mysql db"
#   type        = string
# }

variable "launch_template_instance_type"{
  description = "Instance type for the launch template"
  type        = string
}

variable "auto_scaling_group_min_size"{
  description = "Minimum nodes in the auto scaling group"
  type = number
}

variable "auto_scaling_group_max_size"{
  description = "Max nodes in the auto scaling group"
  type = number
}

# var.mysql_db_address_variable,
#     db_port     = var.mysql_db_port_variable

variable "mysql_db_address_variable" { type = string }
variable "mysql_db_port_variable" { type = number }