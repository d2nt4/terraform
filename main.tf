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

/* module "ec2" {
  source = "./modules/ec2"
  keyPar = var.keyPar
} */

module "rds" {
  source = "./modules/rds"
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}