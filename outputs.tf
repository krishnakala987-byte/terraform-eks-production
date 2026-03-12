output "eks_cluster_id" {
  description = "Name of the EKS cluster"
  value       = module.eks_cluster.cluster_id
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the Kubernetes control plane"
  value       = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_security_group" {
  description = "Security group attached to the EKS control plane"
  value       = module.eks_cluster.cluster_security_group_id
}

output "aws_region" {
  description = "AWS region where resources are deployed"
  value       = var.aws_region
}

output "oidc_provider_arn" {
  description = "OIDC provider used for IAM Roles for Service Accounts"
  value       = module.eks_cluster.oidc_provider_arn
}

output "kubeconfig_update_command" {
  description = "Command to configure kubectl for this cluster"
  value       = "aws eks update-kubeconfig --name ${module.eks_cluster.cluster_name} --region ${var.aws_region}"
}

