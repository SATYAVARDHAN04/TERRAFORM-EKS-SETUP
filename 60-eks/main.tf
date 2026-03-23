module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.project}-${var.environment}"
  kubernetes_version = "1.32"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
    metrics-server={}
  }

  # Optional
  endpoint_public_access = false

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = local.vpc_id
  subnet_ids               = local.private_subnet_id
  control_plane_subnet_ids = local.private_subnet_id
  create_node_security_group = false
  create_security_group = false
  node_security_group_id = local.nodes

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    blue = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]
      cluster_primary_security_group_id=local.eks_control_plane

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
    iam_role_additional_policies={
        AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        AmazonEFSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
        AmazonEKSLoadBalancingPolicy = "arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy"

    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
    Name="${var.project}-${var.environment}-eks"
  }
}