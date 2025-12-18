# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

resource "aws_lb" "web_tier_lb" {
  name               = "web-tier-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_alb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id, aws_subnet.public_3.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}