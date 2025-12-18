# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment

# Create a new ALB Target Group attachment - 80
resource "aws_autoscaling_attachment" "web-tier-attachment-80" {
  autoscaling_group_name = aws_autoscaling_group.web_tier_asg_80.name
  lb_target_group_arn    = aws_lb_target_group.web_tier_tg_80.arn
}

# Create a new ALB Target Group attachment - 443
resource "aws_autoscaling_attachment" "web-tier-attachment-443" {
  autoscaling_group_name = aws_autoscaling_group.web_tier_asg_443.name
  lb_target_group_arn    = aws_lb_target_group.web_tier_tg_443.arn
}