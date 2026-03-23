data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpcid"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.project}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "control_plane" {
  name = "/${var.project}/${var.environment}/control_plane"
}

data "aws_ssm_parameter" "nodes" {
  name = "/${var.project}/${var.environment}/nodes"
}