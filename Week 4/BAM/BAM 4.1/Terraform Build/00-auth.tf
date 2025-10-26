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

# AWS Provider configuration
# This tells Terraform how to connect to AWS
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}