module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "${var.SILVEX-EKS-CLUSTER}"
  cluster_version = "1.28"
  subnet_ids      = [aws_subnet.silvex-sn-172-33-pri-1.id,
			aws_subnet.silvex-sn-172-33-pri-2.id,
			aws_subnet.silvex-sn-172-33-pri-3.id
                ]

  vpc_id = aws_vpc.silvex-vpc-172-33.id

  eks_managed_node_groups = {
    first = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "${var.SILVEX-EC2-TYPE}"
    }
  }
}
