# Outputs display important information after terraform apply

output "lb_url_unsecure" {
  value = "http://${aws_lb.web_tier_lb.dns_name}"
}

output "lb_url_secure" {
  value = "https://${aws_route53_record.www.name}"
}