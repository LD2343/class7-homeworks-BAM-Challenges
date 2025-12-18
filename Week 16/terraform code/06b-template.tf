# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

#80 LT
resource "aws_launch_template" "web_tier_lt_80" {
  name        = "web-tier-lt-80"
  description = "Launch template for web tier servers (unsecure)"

  image_id               = "ami-07860a2d7eb515d9a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_ec2_sg_01.id]
  user_data              = filebase64("./scripts/linux-script1.sh")

  tags = {
    Name = "web-tier-lt-80"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      ManagedBy = "Terraform"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# 443 LT
resource "aws_launch_template" "web_tier_lt_443" {
  name        = "web-tier-lt-443"
  description = "Launch template for web tier servers (secure)"

  image_id               = "ami-07860a2d7eb515d9a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_ec2_sg_02.id]
  user_data              = filebase64("./scripts/linux-script2.sh")

  tags = {
    Name = "web-tier-lt-443"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      ManagedBy = "Terraform"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}