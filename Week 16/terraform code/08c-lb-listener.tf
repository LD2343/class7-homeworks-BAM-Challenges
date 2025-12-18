# 

# 80 LB Listener
resource "aws_lb_listener" "web_tier_http" {
  load_balancer_arn = aws_lb.web_tier_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tier_tg_80.arn
  }
}

# 443 LB Listener
resource "aws_lb_listener" "web_tier_https" {
  load_balancer_arn = aws_lb.web_tier_lb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tier_tg_443.arn
  }
}