resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
   role_arn ="arn:aws:iam::218266829911:role/LabRole"
  vpc_config {
    subnet_ids = [
      "subnet-054fd254926d532fe", # us-east-1a
      "subnet-0f46545f4ec73ce69", # us-east-1b
      "subnet-046d813e510f8a9bc"  # us-east-1c
    ]
    security_group_ids = [aws_security_group.eks_sg.id]
  }

  tags = {
    Environment = "dev"
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "my-node-group"
  node_role_arn = "arn:aws:iam::218266829911:role/LabRole"

  subnet_ids = [
    "subnet-054fd254926d532fe", # us-east-1a
    "subnet-0f46545f4ec73ce69", # us-east-1b
    "subnet-046d813e510f8a9bc"  # us-east-1c
  ]

  scaling_config {
    desired_size = 3
    min_size     = 2
    max_size     = 5
  }

  instance_types = ["t3.medium"]
  capacity_type  = "ON_DEMAND"

  tags = {
    Environment = "dev"
  }
}
