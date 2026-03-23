data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpcid"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "albsg" {
  name = "/${var.project}/${var.environment}/frontendalb_sg"
}

data "aws_ssm_parameter" "acm_certificate_arn" {
  name = "/${var.project}/${var.environment}/acm_certificate_arn"
}