# Security Group para SSH - Test
resource "aws_security_group" "vpc-ssh-test" {
  name        = "test-vpc-ssh"
  description = "Test VPC SSH"
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

# Security Group para Web - Test
resource "aws_security_group" "vpc-web-test" {
  name        = "test-vpc-web"
  description = "Test VPC web"
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

# Security Group para EKS - Test
resource "aws_security_group" "eks-sg-test" {
  name        = "test-eks-cluster-sg"
  description = "Security group for EKS cluster in Test"
  vpc_id      = aws_vpc.main_vpc_test.id

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
    Name = "test-eks-cluster-sg"
  }
}
