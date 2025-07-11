terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }

  #backend config
  /* before add backend config we need to create s3 bucket and dynamodb table. Comment this backend block before you going to create s3 bucket and dynamo DB table*/
  # backend "s3" {
  #   bucket = "terraform-up-and-running-state-rc-25mar2025" #name of the bucket. Name can not be used as variable
  #   key    = "global/s3/terraform.tfstate" #Make sure to change this key value to match the current file path to get 1:1 mapping between state file and file path
  #   region = "ap-south-1"

  #   dynamodb_table = "terraform-up-and-running-locks"
  # }
}

provider "aws" {
  region = "ap-south-1"
}

#aws s3 bucket
resource "aws_s3_bucket" "terraform_state_bucket" {
  #bucket        = "terraform-up-and-running-state-rc-25mar2025"
  bucket        = var.backend-s3-bucket-name
  force_destroy = true

  tags = {
    Name = "terraform-state-file-bucket"
  }
  #Comment this before delete the s3 bucket
  #prevent assidential deletion
  # lifecycle {
  #   prevent_destroy = true
  # }
}

#enable versioning
resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#enable s3 bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#s3 bucket public access block
resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_public_access" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#AWS dynamodb for state locking
resource "aws_dynamodb_table" "terraform_state_dynamodb_table" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}