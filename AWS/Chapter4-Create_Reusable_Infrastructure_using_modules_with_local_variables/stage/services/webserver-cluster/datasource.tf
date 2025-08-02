data "terraform_remote_state" "mysql_rds_db_datasource" {
  backend = "s3"
  config = {
    # bucket = var.mysql_db_remote_state_bucket
    # key    = var.mysql_db_remote_state_key
    bucket = "terraform-up-and-running-state-rc-29july2025"
    key    = "stage/data-storage/mysql/terraform.tfstate"
    region = "ap-south-1"
  }
}