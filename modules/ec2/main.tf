terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  access_key = var.accessKey
  secret_key = var.secretKey
  token = var.token
  region = var.region
}