resource "aws_ssm_parameter" "sg-id" {
  name  = "/${var.project}/${var.environment}/frontend_sg"
  type  = "String"
  value = module.frontend_sg.sg_id
}

resource "aws_ssm_parameter" "bastion-sg" {
  name  = "/${var.project}/${var.environment}/bastionsg"
  type  = "String"
  value = module.bastion.sg_id
}

resource "aws_ssm_parameter" "alb-sg" {
  name  = "/${var.project}/${var.environment}/albsg"
  type  = "String"
  value = module.backend_alb.sg_id
}

resource "aws_ssm_parameter" "vpn-sg" {
  name  = "/${var.project}/${var.environment}/vpnsg"
  type  = "String"
  value = module.vpn_sg.sg_id
}

resource "aws_ssm_parameter" "mongodb-sg" {
  name  = "/${var.project}/${var.environment}/mongodb_sg"
  type  = "String"
  value = module.mongodb_sg.sg_id
}

resource "aws_ssm_parameter" "redis-sg" {
  name  = "/${var.project}/${var.environment}/redis_sg"
  type  = "String"
  value = module.redis_sg.sg_id
}

resource "aws_ssm_parameter" "rabbitmq-sg" {
  name  = "/${var.project}/${var.environment}/rabbitmq_sg"
  type  = "String"
  value = module.rabbitmq_sg.sg_id
}

resource "aws_ssm_parameter" "mysql-sg" {
  name  = "/${var.project}/${var.environment}/mysql_sg"
  type  = "String"
  value = module.mysql_sg.sg_id
}

resource "aws_ssm_parameter" "catalogue-sg" {
  name  = "/${var.project}/${var.environment}/catalogue_sg"
  type  = "String"
  value = module.catalogue_sg.sg_id
}

resource "aws_ssm_parameter" "cart-sg" {
  name  = "/${var.project}/${var.environment}/cart_sg"
  type  = "String"
  value = module.cart_sg.sg_id
}

resource "aws_ssm_parameter" "user-sg" {
  name  = "/${var.project}/${var.environment}/user_sg"
  type  = "String"
  value = module.user_sg.sg_id
}

resource "aws_ssm_parameter" "shipping-sg" {
  name  = "/${var.project}/${var.environment}/shipping_sg"
  type  = "String"
  value = module.shipping_sg.sg_id
}

resource "aws_ssm_parameter" "payment-sg" {
  name  = "/${var.project}/${var.environment}/payment_sg"
  type  = "String"
  value = module.payment_sg.sg_id
}

resource "aws_ssm_parameter" "frontend-alb" {
  name  = "/${var.project}/${var.environment}/frontendalb_sg"
  type  = "String"
  value = module.frontend_alb.sg_id
}