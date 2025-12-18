# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule

# EC2 Security Group #1
resource "aws_security_group" "web_ec2_sg_01" {
  name        = "web-ec2-lb-01"
  description = "Allow unsecure traffic from Web ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "web-ec2-sg-01"
    Tier = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_http_01" {
  security_group_id            = aws_security_group.web_ec2_sg_01.id
  description                  = "HTTP from Web LB Unsecure"
  referenced_security_group_id = aws_security_group.web_alb_sg.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_ssh_01" {
  security_group_id = aws_security_group.web_ec2_sg_01.id
  description       = "SSH from Web LB"
  cidr_ipv4         = "10.130.0.0/16"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "web_ec2_egress_01" {
  security_group_id = aws_security_group.web_ec2_sg_01.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# EC2 Security Group #2
resource "aws_security_group" "web_ec2_sg_02" {
  name        = "web-ec2-lb-02"
  description = "Allow secure traffic from Web ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "web-ec2-sg-02"
    Tier = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_http_02" {
  security_group_id            = aws_security_group.web_ec2_sg_02.id
  description                  = "HTTP from Web LB Secure"
  referenced_security_group_id = aws_security_group.web_alb_sg.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_ssh_02" {
  security_group_id = aws_security_group.web_ec2_sg_02.id
  description       = "SSH from Web LB"
  cidr_ipv4         = "10.130.0.0/16"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "web_ec2_egress" {
  security_group_id = aws_security_group.web_ec2_sg_02.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}