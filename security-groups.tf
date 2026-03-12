resource "aws_security_group" "worker_nodes" {

  name_prefix = "eks-worker-nodes"
  description = "Security group for EKS worker nodes"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "eks-worker-node-sg"
  }

}

resource "aws_security_group_rule" "worker_nodes_ingress" {

  description = "Allow internal communication between worker nodes"

  type              = "ingress"
  security_group_id = aws_security_group.worker_nodes.id

  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16"
  ]

}

resource "aws_security_group_rule" "worker_nodes_egress" {

  description = "Allow outbound internet access"

  type              = "egress"
  security_group_id = aws_security_group.worker_nodes.id

  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks = ["0.0.0.0/0"]

}
