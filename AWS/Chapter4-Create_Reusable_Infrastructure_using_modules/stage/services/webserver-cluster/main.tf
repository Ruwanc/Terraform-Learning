module "webserver-cluster-module"{
    source = "../../modules/services/webserver-cluster"
    web_server_cluster_name = "staging-webserver-cluster"
    mysql_db_remote_state_bucket = "terraform-up-and-running-state-rc-25mar2025"
    mysql_db_remote_state_key = "stage/services/mysql-db/terraform.tfstate"
    launch_template_instance_type = "t2.micro"
    auto_scaling_group_min_size = 1
    auto_scaling_group_max_size = 3
}