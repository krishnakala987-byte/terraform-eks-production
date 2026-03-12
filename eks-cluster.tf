module "eks_cluster" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  tags = {
    Environment = "development"
    Project     = "terraform-eks-demo"
  }

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.medium"]

    vpc_security_group_ids = [
      aws_security_group.worker_nodes.id
    ]
  }

  eks_managed_node_groups = {

    default_nodes = {

      min_size     = 2
      max_size     = 6
      desired_size = 2

      capacity_type = "ON_DEMAND"

    }

  }

}
