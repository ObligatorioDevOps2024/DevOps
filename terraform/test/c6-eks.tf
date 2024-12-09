resource "aws_eks_cluster" "eks_cluster" {
  name     = "test_eks_cluster"
  role_arn = "arn:aws:iam::218266829911:role/LabRole"
  vpc_config {
    subnet_ids = [
      aws_subnet.subnet_a_test.id,
      aws_subnet.subnet_b_test.id,
      aws_subnet.subnet_c_test.id      
    ]
    security_group_ids = [aws_security_group.eks-sg-test.id]
  }

  tags = {
    Environment = "test"
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "test-node-group"
  node_role_arn   = "arn:aws:iam::218266829911:role/LabRole"

  subnet_ids = [
    aws_subnet.subnet_a_test.id,
    aws_subnet.subnet_b_test.id,
    aws_subnet.subnet_c_test.id
  ]

  scaling_config {
    desired_size = 3
    min_size     = 2
    max_size     = 5
  }

  instance_types = ["t3.medium"]
  capacity_type  = "ON_DEMAND"

  tags = {
    Environment = "test"
  }
}