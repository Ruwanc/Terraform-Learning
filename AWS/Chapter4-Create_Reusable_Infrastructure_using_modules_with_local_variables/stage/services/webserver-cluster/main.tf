terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
  ##Need to remove from module
  #backend config
  /* before add backend config we need to create s3 bucket and dynamodb table. Comment this backend block before you going to create s3 bucket and dynamo DB table*/
  backend "s3" {
    bucket = "terraform-up-and-running-state-rc-29july2025"       #name of the bucket
    key    = "stage/services/webserver-cluster/terraform.tfstate" #Make sure to change this key value to match the current file path to get 1:1 mapping between state file and file path
    region = "ap-south-1"

    #dynamodb_table = "terraform-up-and-running-locks"
  }
}
#Need to remove from module
provider "aws" {
  region = "ap-south-1"
}

module "webserver-cluster-module" {
  source                        = "../../../modules/services/webserver-cluster"
  web_server_cluster_name       = var.web_server_cluster_name
  launch_template_instance_type = var.launch_template_instance_type
  auto_scaling_group_min_size   = var.auto_scaling_group_min_size
  auto_scaling_group_max_size   = var.auto_scaling_group_max_size
  mysql_db_address_variable     = data.terraform_remote_state.mysql_rds_db_datasource.outputs.mysql_rds_db_address_from_module
  mysql_db_port_variable        = data.terraform_remote_state.mysql_rds_db_datasource.outputs.mysql_rds_db_port_from_module
}
