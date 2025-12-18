# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate

data "aws_acm_certificate" "cert" {
  domain   = "a4l-class7.com"
  statuses = ["ISSUED"]
  most_recent = true
}