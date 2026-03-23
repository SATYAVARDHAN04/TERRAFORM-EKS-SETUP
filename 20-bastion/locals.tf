locals {
  ami              = data.aws_ami.joindevops.id
  bastion          = data.aws_ssm_parameter.bastionsg.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_id.value)[0]
}