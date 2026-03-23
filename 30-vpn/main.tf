resource "aws_key_pair" "openvpn" {
  key_name   = "openvpn"
  public_key = file("C:\\MAIN_TERRAFORM\\roboshop-infra-dev\\30-vpn\\openvpn.pub")
}

resource "aws_instance" "vpn" {
  ami                    = local.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [local.vpn]
  subnet_id              = local.public_subnet_id
  key_name = aws_key_pair.openvpn.key_name # make sure key exsists in AWS
  tags = merge(var.common_tags, {
    Name = "${var.project}-${var.environment}-bastionec2"
  })
}