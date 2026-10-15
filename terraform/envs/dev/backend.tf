terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-s3-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}