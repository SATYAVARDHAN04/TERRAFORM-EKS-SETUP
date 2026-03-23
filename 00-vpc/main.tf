module "vpc-roboshop" {
  #source               = "../terraform-aws-vpc"
  source               = "git::https://github.com/SATYAVARDHAN04/terraform-aws-vpc.git?ref=master"
  project              = var.project
  environment          = var.environment
  public_subnet_cidr   = var.public_cidr
  private_subnet_cidr  = var.private_cidr
  database_subnet_cidr = var.databse_cidr
  is_peering_required  = false
}