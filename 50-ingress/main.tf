module "frontend_alb" {
  source                     = "terraform-aws-modules/alb/aws"
  name                       = local.name
  vpc_id                     = data.aws_ssm_parameter.vpc_id.value
  subnets                    = split(",", data.aws_ssm_parameter.public_subnet_id.value)
  create_security_group      = false
  security_groups            = [data.aws_ssm_parameter.albsg.value]
  internal                   = false
  enable_deletion_protection = false

  tags = {
    name = local.name
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = module.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_ssm_parameter.acm_certificate_arn.value

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello i am from frontend alb using https</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "frontend-alb" {
  zone_id = var.zone_id
  name    = "*.${var.zone_name}"
  type    = "A"

  alias {
    name                   = module.frontend_alb.dns_name
    zone_id                = module.frontend_alb.zone_id #zone id of alb
    evaluate_target_health = true
  }
}