terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
  #backend config
  /* before add backend config we need to create s3 bucket and dynamodb table. Comment this backend block before you going to create s3 bucket and dynamo DB table*/
  backend "s3" {
    bucket = "terraform-up-and-running-state-rc-25mar2025" #name of the bucket
    key    = "stage/data-storage/mysql/terraform.tfstate"  #Make sure to change this key value to match the current file path to get 1:1 mapping between state file and file path
    region = "ap-south-1"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "mysql_rds_instance_module" {
  source                  = "../../../modules/data-storage/mysql"
  mysql_db_name           = "stageMysqlRdsDb"
  mysql_rds_instance_type = "db.t3.micro"
  mysql_rds_db_username   = var.mysql_rds_db_password
  mysql_rds_db_password   = var.mysql_rds_db_password

}