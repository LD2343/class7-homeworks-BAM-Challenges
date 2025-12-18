# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/vpc

# VPC resource
# This creates the virtual private cloud
resource "aws_vpc" "main" {
  cidr_block = "10.130.0.0/16"

  tags = {
    Name = "demo-vpc"
  }
}