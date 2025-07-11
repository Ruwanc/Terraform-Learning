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
    key    = "production/services/webserver-cluster/terraform.tfstate" #Make sure to change this key value to match the current file path to get 1:1 mapping between state file and file path
    region = "ap-south-1"

    dynamodb_table = "terraform-up-and-running-locks"
  }
}
#Need to remove from module
provider "aws" {
  region = "ap-south-1"
}


module "webserver-cluster-module"{
    source = "../../../modules/services/webserver-cluster"
    web_server_cluster_name = "production-webserver-cluster"
    mysql_db_remote_state_bucket = "terraform-up-and-running-state-rc-25mar2025"
    mysql_db_remote_state_key = "production/services/mysql-db/terraform.tfstate"
    launch_template_instance_type = "t2.micro"
    auto_scaling_group_min_size = 3
    auto_scaling_group_max_size = 4
}

# resource "aws_autoscaling_group" "production-webserver-cluster-autoscaleup" {
#   availability_zones        = ["ap-south-1a"]
#   name                      = "terraform-test-foobar5"
#   max_size                  = 1
#   min_size                  = 1
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   force_delete              = true
#   termination_policies      = ["OldestInstance"]
# }

resource "aws_autoscaling_schedule" "production-autoscale-up-schedule" {
  scheduled_action_name  = "production-webserver-cluster-morning-autoscaler-schedule"
  min_size               = 3
  max_size               = 4
  desired_capacity       = 3
  recurrence             = "0 9 * * *"
  autoscaling_group_name = module.webserver-cluster-module.webserver-auto-scaling-group-name
}

resource "aws_autoscaling_schedule" "production-autoscale-down-schedule" {
  scheduled_action_name  = "production-webserver-cluster-night-autoscaler-schedule"
  min_size               = 2
  max_size               = 3
  desired_capacity       = 2
  recurrence             = "0 17 * * *"
  autoscaling_group_name = module.webserver-cluster-module.webserver-auto-scaling-group-name
}