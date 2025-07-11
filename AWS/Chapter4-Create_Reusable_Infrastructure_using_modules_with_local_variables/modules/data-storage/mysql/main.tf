/*
 _____                    __                      
|_   _|__ _ __ _ __ __ _ / _| ___  _ __ _ __ ___  
  | |/ _ \ '__| '__/ _` | |_ / _ \| '__| '_ ` _ \ 
  | |  __/ |  | | | (_| |  _| (_) | |  | | | | | |
 _|_|\___|_|  |_| _\__,_|_|  \___/|_|  |_| |_| |_|
|  \/  | ___   __| |_   _| | ___                  
| |\/| |/ _ \ / _` | | | | |/ _ \                 
| |  | | (_) | (_| | |_| | |  __/                 
|_|  |_|\___/ \__,_|\__,_|_|\___|                 

*/


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}


#create aws rds mysql instance
resource "aws_db_instance" "mysql_rds_db" {
  allocated_storage    = 10
  db_name              = var.mysql_db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.mysql_rds_instance_type
  username             = var.mysql_rds_db_username
  password             = var.mysql_rds_db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}