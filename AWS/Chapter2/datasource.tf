#VPC defaults
data "aws_vpc" "default" {
  default = true
}

#subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#ssh key pair for ec2
data "aws_key_pair" "example" {
  key_name           = "aws_key_mumbai_region"
  include_public_key = true
}