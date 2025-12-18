# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule

# Web ALB Security Group 
resource "aws_security_group" "web_alb_sg" {
  name        = "web-alb-sg"
  description = "Allow HTTP & HTTPS for web tier ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "web-alb-sg"
    Tier = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_alb_http" {
  security_group_id = aws_security_group.web_alb_sg.id
  description       = "HTTP from internet"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_alb_https" {
  security_group_id = aws_security_group.web_alb_sg.id
  description       = "HTTPS from internet"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "web_alb_egress" {
  security_group_id = aws_security_group.web_alb_sg.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}