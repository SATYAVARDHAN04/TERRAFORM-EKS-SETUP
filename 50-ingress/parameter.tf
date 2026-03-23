resource "aws_ssm_parameter" "ingress_listerner_arn" {
  name  = "/${var.project}/${var.environment}/ingress_listerner_arn"
  type  = "String"
  value = aws_lb_listener.ingress.arn
}