#values for the below variables will get from environment variables. Just set the environment variables and there will be no any other configurations
/*
export TF_VAR_mysql_rds_db_username="user_root"
export TF_VAR_mysql_rds_db_password="password_root"
*/
variable "mysql_rds_db_username" {
  description = "the username for the db"
  type        = string
  sensitive   = true
}

variable "mysql_rds_db_password" {
  description = "db password"
  type        = string
  sensitive   = true
}

variable "mysql_db_name" {
  description = "The name of mysql database"
  type        = string
  default     = "test_db"
}