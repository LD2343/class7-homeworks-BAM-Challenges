# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription

# SNS Topic 80
resource "aws_sns_topic" "asg-sns-actons-80" {
  name = "asg-sns-actions-80"
}

resource "aws_sns_topic_subscription" "asg-sns-sub-80" {
  topic_arn = aws_sns_topic.asg-sns-actons-80.arn
  protocol = "email"
  endpoint = "logandaniel2343@gmail.com"
}

resource "aws_autoscaling_notification" "asg-notification-80" {
  group_names = [aws_autoscaling_group.web_tier_asg_80.name]
  
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.asg-sns-actons-80.arn
}

# SNS Topic 443
resource "aws_sns_topic" "asg-sns-actons-443" {
  name = "asg-sns-actions-443"
}

resource "aws_sns_topic_subscription" "asg-sns-sub-443" {
  topic_arn = aws_sns_topic.asg-sns-actons-443.arn
  protocol = "email"
  endpoint = "logandaniel2343@gmail.com"
}

resource "aws_autoscaling_notification" "asg-notification-443" {
  group_names = [aws_autoscaling_group.web_tier_asg_443.name]
  
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.asg-sns-actons-443.arn
}