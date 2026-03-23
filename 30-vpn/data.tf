data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpcid"
}

data "aws_ami" "open_vpn_ami" {
  owners      = ["679593333241"]
  most_recent = true
  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image-3b5882c4-551b-43fa-acfe-7f5cdb896ff1"]
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

data "aws_ssm_parameter" "vpnsg" {
  name = "/${var.project}/${var.environment}/vpnsg"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}

