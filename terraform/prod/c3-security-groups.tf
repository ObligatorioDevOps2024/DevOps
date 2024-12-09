# Security Group para SSH - Prod
resource "aws_security_group" "vpc-ssh-prod" {
  name        = "prod-vpc-ssh"
  description = "Prod VPC SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group para Web - Prod
resource "aws_security_group" "vpc-web-prod" {
  name        = "prod-vpc-web"
  description = "Prod VPC web"
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group para EKS - Prod
resource "aws_security_group" "eks-sg-prod" {
  name        = "prod-eks-cluster-sg"
  description = "Security group for EKS cluster in Prod"
  vpc_id      = aws_vpc.main_vpc_prod.id

  ingress {
    description = "Allow inbound traffic from the EKS API server"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "Allow communication between nodes in the EKS cluster"
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod-eks-cluster-sg"
  }
}
