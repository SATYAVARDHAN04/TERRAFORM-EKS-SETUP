# Security group
module "bastion" {
  source      = "git::https://github.com/SATYAVARDHAN04/terraform-aws-securitygroup.git?ref=master"
  environment = var.environment
  project     = var.project
  vpc_id      = local.vpc_id
  purpose     = "bastion"
}

module "vpn_sg" {
  source      = "git::https://github.com/SATYAVARDHAN04/terraform-aws-securitygroup.git?ref=master"
  environment = var.environment
  project     = var.project
  vpc_id      = local.vpc_id
  purpose     = "vpn_sg"
}

module "ingress_alb" {
  source      = "git::https://github.com/SATYAVARDHAN04/terraform-aws-securitygroup.git?ref=master"
  environment = var.environment
  project     = var.project
  vpc_id      = local.vpc_id
  purpose     = "ingress_alb"
}

module "control_plane" {
  source      = "git::https://github.com/SATYAVARDHAN04/terraform-aws-securitygroup.git?ref=master"
  environment = var.environment
  project     = var.project
  vpc_id      = local.vpc_id
  purpose     = "control_plane"
}

module "nodes" {
  source      = "git::https://github.com/SATYAVARDHAN04/terraform-aws-securitygroup.git?ref=master"
  environment = var.environment
  project     = var.project
  vpc_id      = local.vpc_id
  purpose     = "nodes"
}

# Bastion host accespting connections from my laptop
resource "aws_security_group_rule" "bastion_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}

# vpn security group -- 22,443,1194,943
resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id
}

resource "aws_security_group_rule" "vpn_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id
}

resource "aws_security_group_rule" "vpn_openvpn" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id
}

resource "aws_security_group_rule" "vpn_admin" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id
}


resource "aws_security_group_rule" "https-to-ingressalb" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.ingress_alb.sg_id
}

resource "aws_security_group_rule" "bastion-to-nodes" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.nodes.sg_id
}

resource "aws_security_group_rule" "control_plane-to-nodes" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.control_plane.sg_id
  security_group_id = module.nodes.sg_id
}

resource "aws_security_group_rule" "nodes-to-control_plane" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.nodes.sg_id
  security_group_id = module.control_plane.sg_id
}

resource "aws_security_group_rule" "bastion-to-control_plane" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.control_plane.sg_id
}

resource "aws_security_group_rule" "node-to-node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks = [ "10.0.0.0/16" ]
  security_group_id = module.nodes.sg_id
}
