# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy

# Autoscaling Policy 80
resource "aws_autoscaling_policy" "web_tier_cpu_80" {
  name                      = "web-tier-cpu-policy-80"
  autoscaling_group_name    = aws_autoscaling_group.web_tier_asg_80.name
  estimated_instance_warmup = 60
  policy_type               = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}

# Autoscaling Policy 443
resource "aws_autoscaling_policy" "web_tier_cpu_443" {
  name                      = "web-tier-cpu-policy-443"
  autoscaling_group_name    = aws_autoscaling_group.web_tier_asg_443.name
  estimated_instance_warmup = 60
  policy_type               = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}