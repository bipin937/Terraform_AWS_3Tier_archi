terraform {
  required_version = "~> 1.1"  
  required_providers {
    aws = {
      version = "~> 3.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {

  region = var.aws_region
}