# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone

data "aws_route53_zone" "main" {
  name         = "a4l-class7.com"  # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "a4l-class7.com"
  type    = "A"

  alias {
    name                   = aws_lb.web_tier_lb.dns_name
    zone_id                = aws_lb.web_tier_lb.zone_id
    evaluate_target_health = true
  }
}