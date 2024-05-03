resource "aws_route53_record" "personal_route53_record" {
  zone_id = var.zone_id
  name = "personal-app.uat"
  type = "A"
  alias {
    name = aws_lb.personal_application_lb.dns_name
    zone_id = aws_lb.personal_application_lb.zone_id
    evaluate_target_health = true
}
}

