resource "aws_vpc" "main_vpc_dev" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main_vpc_dev"
  }
}

resource "aws_subnet" "subnet_a_dev" {
  vpc_id                  = aws_vpc.main_vpc_dev.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-dev"
  }
}

resource "aws_subnet" "subnet_b_dev" {
  vpc_id                  = aws_vpc.main_vpc_dev.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-b-dev"
  }
}

resource "aws_subnet" "subnet_c_dev" {
  vpc_id                  = aws_vpc.main_vpc_dev.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-c-dev"
  }
}