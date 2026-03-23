resource "aws_acm_certificate" "satyology" {
  domain_name               = "satyology.site"
  subject_alternative_names = ["*.satyology.site"]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true # Recommended to avoid downtime during certificate replacement
  }
  tags = {
    Name = "${var.project}-${var.environment}"
  }
}

resource "aws_route53_record" "satyology" {
  for_each = {
    for dvo in aws_acm_certificate.satyology.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "satyology" {
  certificate_arn         = aws_acm_certificate.satyology.arn
  validation_record_fqdns = [for record in aws_route53_record.satyology : record.fqdn]
}