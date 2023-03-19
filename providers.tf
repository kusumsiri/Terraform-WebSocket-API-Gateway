terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region   = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::847855290887:role/lambda-apigateway-role-Jan21-2023"
  }
}