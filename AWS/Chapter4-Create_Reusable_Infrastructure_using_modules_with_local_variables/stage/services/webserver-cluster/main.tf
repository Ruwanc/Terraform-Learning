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
    bucket = "terraform-up-and-running-state-rc-25mar2025"        #name of the bucket
    key    = "stage/services/webserver-cluster/terraform.tfstate" #Make sure to change this key value to match the current file path to get 1:1 mapping between state file and file path
    region = "ap-south-1"

    dynamodb_table = "terraform-up-and-running-locks"
  }
}
#Need to remove from module
provider "aws" {
  region = "ap-south-1"
}

module "webserver-cluster-module" {
  source                        = "../../../modules/services/webserver-cluster"
  web_server_cluster_name       = "staging-webserver-cluster"
  mysql_db_remote_state_bucket  = "terraform-up-and-running-state-rc-25mar2025"
  mysql_db_remote_state_key     = "stage/services/mysql-db/terraform.tfstate"
  launch_template_instance_type = "t2.micro"
  auto_scaling_group_min_size   = 1
  auto_scaling_group_max_size   = 3
}