resource "aws_instance" "bastion_host" {
  ami                    = local.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [local.bastion]
  subnet_id              = local.public_subnet_id
  iam_instance_profile   = "EC2FETCHSSMPARAM"
  tags = merge(var.common_tags, {
    Name = "${var.project}-${var.environment}-bastionec2"
  })
}