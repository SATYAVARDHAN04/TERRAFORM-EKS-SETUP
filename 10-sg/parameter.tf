resource "aws_ssm_parameter" "bastion-sg" {
  name  = "/${var.project}/${var.environment}/bastionsg"
  type  = "String"
  value = module.bastion.sg_id
}

resource "aws_ssm_parameter" "vpn-sg" {
  name  = "/${var.project}/${var.environment}/vpnsg"
  type  = "String"
  value = module.vpn_sg.sg_id
}

resource "aws_ssm_parameter" "ingress" {
  name  = "/${var.project}/${var.environment}/ingress"
  type  = "String"
  value = module.ingress.sg_id
}

resource "aws_ssm_parameter" "control_plane" {
  name  = "/${var.project}/${var.environment}/control_plane"
  type  = "String"
  value = module.control_plane.sg_id
}

resource "aws_ssm_parameter" "nodes" {
  name  = "/${var.project}/${var.environment}/nodes"
  type  = "String"
  value = module.nodes.sg_id
}