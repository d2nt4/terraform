# Set the variables for the AWS provider
variable "accessKey" {
  type = string
}

variable "secretKey" {
  type = string
}

variable "keyPar" {
  type = string
}

variable "token" {
  type = string
}

variable "region" {
  type = string
}

# Set the variables for the RDS module
variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}