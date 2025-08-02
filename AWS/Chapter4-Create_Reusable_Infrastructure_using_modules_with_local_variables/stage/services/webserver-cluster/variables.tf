variable "web_server_cluster_name" {
  description = "Name of the web server cluster to use with all cluster resources"
  type        = string
  default     = "staging-web-c"
}

variable "mysql_db_remote_state_bucket" {
  description = "Name of the s3 bucket which is using for backend configuration of mysql db"
  type        = string
  default     = "terraform-up-and-running-state-rc-29july2025"
}

variable "mysql_db_remote_state_key" {
  description = "Name of the key which is using for backend configuration of mysql db"
  type        = string
  default     = "stage/data-storage/mysql/terraform.tfstate"
}

variable "launch_template_instance_type" {
  description = "Instance type for the launch template"
  type        = string
  default     = "t2.micro"
}

variable "auto_scaling_group_min_size" {
  description = "Minimum nodes in the auto scaling group"
  type        = number
  default     = 1
}

variable "auto_scaling_group_max_size" {
  description = "Max nodes in the auto scaling group"
  type        = number
  default     = 3
}

# var.mysql_db_address_variable,
#     db_port     = var.mysql_db_port_variable

# variable "mysql_db_address_variable" { type = string }
# variable "mysql_db_port_variable" { type = number }