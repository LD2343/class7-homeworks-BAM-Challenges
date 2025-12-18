# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs

# Terraform configuration block
# This defines the minimum Terraform version and required providers
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "class7-s3-backend"
    key    = "11.25.25/terraform.tfstate"
    region = "us-east-1"
  }
}

# AWS Provider configuration
# This tells Terraform how to connect to AWS
provider "aws" {
  region  = "us-east-1"
  profile = "default"

# # Default tags are applied to all resources created by this provider
#   default_tags {
#     tags = {
#       Project = "Class7"
#       ManagedBy = "Terraform"
#     }
#   }
}
