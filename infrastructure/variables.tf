variable "env" {
  default     = "sr"
  description = "Environment name"
}

variable "region" {
  default     = "eu-central-1"
  description = "AWS region"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "${var.env}-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
