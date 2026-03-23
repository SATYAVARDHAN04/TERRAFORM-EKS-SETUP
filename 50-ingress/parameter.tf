resource "aws_ssm_parameter" "frontend_alb_listerner_arn" {
  name  = "/${var.project}/${var.environment}/frontend_alb_listerner_arn"
  type  = "String"
  value = aws_lb_listener.alb_listener.arn
}