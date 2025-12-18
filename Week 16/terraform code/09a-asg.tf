# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

# ASG 80
resource "aws_autoscaling_group" "web_tier_asg_80" {
  name                = "web-tier-asg-80"
  vpc_zone_identifier = [aws_subnet.private_1.id, aws_subnet.private_2.id, aws_subnet.private_3.id]
  max_size            = 6
  min_size            = 3
  health_check_type   = "ELB"
  target_group_arns   = [aws_lb_target_group.web_tier_tg_80.arn]

  launch_template {
    id      = aws_launch_template.web_tier_lt_80.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-tier-instance-80"
    propagate_at_launch = true
  }

  force_delete = true
}

# ASG 443
resource "aws_autoscaling_group" "web_tier_asg_443" {
  name                = "web-tier-asg-443"
  vpc_zone_identifier = [aws_subnet.private_1.id, aws_subnet.private_2.id, aws_subnet.private_3.id]
  max_size            = 6
  min_size            = 3
  health_check_type   = "ELB"
  target_group_arns   = [aws_lb_target_group.web_tier_tg_443.arn]

  launch_template {
    id      = aws_launch_template.web_tier_lt_443.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-tier-instance-443"
    propagate_at_launch = true
  }

  force_delete = true
}