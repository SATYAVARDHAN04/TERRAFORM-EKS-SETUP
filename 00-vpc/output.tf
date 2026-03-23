output "vpc_id" {
  value = module.vpc-roboshop.vpc_id
}

# output "az-info" {
#     value = module.vpc-roboshop.az-testing
# }

output "public_subnet_id" {
  value = module.vpc-roboshop.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc-roboshop.private_subnet_id
}

output "databse_subnet_id" {
  value = module.vpc-roboshop.database_subnet_id
}