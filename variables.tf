variable "aws_region" {
  description = "AWS region where infrastructure will be deployed"
  type        = string
  default     = "ap-south-1"
}

variable "kubernetes_version" {
  description = "Kubernetes version used for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC network"
  type        = string
  default     = "10.0.0.0/16"
}
