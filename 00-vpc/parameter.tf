resource "aws_ssm_parameter" "vpc-id" {
  name  = "/${var.project}/${var.environment}/vpcid"
  type  = "String"
  value = module.vpc-roboshop.vpc_id
}

resource "aws_ssm_parameter" "public-subnet-id" {
  name  = "/${var.project}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc-roboshop.public_subnet_id)
}

resource "aws_ssm_parameter" "private-subnet-id" {
  name  = "/${var.project}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc-roboshop.private_subnet_id)
}

resource "aws_ssm_parameter" "database-subnet-id" {
  name  = "/${var.project}/${var.environment}/database_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc-roboshop.database_subnet_id)
}