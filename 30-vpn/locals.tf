locals {
  ami              = data.aws_ami.open_vpn_ami.id
  vpn              = data.aws_ssm_parameter.vpnsg.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_id.value)[0]
}