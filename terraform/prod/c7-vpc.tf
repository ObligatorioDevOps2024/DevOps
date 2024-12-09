resource "aws_vpc" "main_vpc_prod" {
  cidr_block           = "172.33.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main_vpc_prod"
  }
}

resource "aws_subnet" "subnet_a_prod" {
  vpc_id                  = aws_vpc.main_vpc_prod.id
  cidr_block              = "172.33.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_a_prod"
  }
}

resource "aws_subnet" "subnet_b_prod" {
  vpc_id                  = aws_vpc.main_vpc_prod.id
  cidr_block              = "172.33.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_b_prod"
  }
}

resource "aws_subnet" "subnet_c_prod" {
  vpc_id                  = aws_vpc.main_vpc_prod.id
  cidr_block              = "172.33.32.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_c_prod"
  }
}