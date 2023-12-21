variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_ENVIRONMENT" {
  default = "Development"
}

variable "private_subnet_name" {
  default = "dev-us-east-1a-private"
}

variable "public_subnet_name" {
  default = "dev-us-east-1a-public"
}
