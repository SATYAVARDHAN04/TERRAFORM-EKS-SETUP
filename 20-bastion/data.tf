data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpcid"
}

data "aws_ami" "joindevops" {
  owners      = ["973714476881"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "bastionsg" {
  name = "/${var.project}/${var.environment}/bastionsg"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}

