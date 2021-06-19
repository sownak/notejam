module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.19"
  subnets         = module.vpc.private_subnets

  tags = {
    Environment = "testing"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  node_groups = { 
    first = {      
      instance_type                 = "m4.large"

      max_capacity              = 5
      min_capacity              = 1
      desired_capacity          = 1
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
