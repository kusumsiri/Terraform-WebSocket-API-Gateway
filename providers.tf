terraform {
  required_providers {
    aws = {
        ssource = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}