provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

resource "random_string" "cluster_suffix" {
  length  = 6
  special = false
}

locals {
  cluster_name = "terraform-eks-${random_string.cluster_suffix.result}"
}

module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name = "terraform-eks-vpc"

  cidr = var.vpc_cidr

  azs = slice(data.aws_availability_zones.available.names, 0, 2)

  private_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  public_subnets = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = "development"
    Project     = "terraform-eks-cluster"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

}
