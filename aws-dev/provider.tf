provider "aws" {
  region = var.AWS_REGION

  default_tags {
    tags = {
      Environment = var.AWS_ENVIRONMENT
      Terraform   = "true"
    }
  }
}
