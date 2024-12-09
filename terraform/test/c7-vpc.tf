resource "aws_vpc" "main_vpc_test" {
  cidr_block           = "172.32.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main_vpc_test"
  }
}


resource "aws_subnet" "subnet_a_test" {
  vpc_id                  = aws_vpc.main_vpc_test.id
  cidr_block              = "172.32.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-test"
  }
}

resource "aws_subnet" "subnet_b_test" {
  vpc_id                  = aws_vpc.main_vpc_test.id
  cidr_block              = "172.32.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-b-test"
  }
}

resource "aws_subnet" "subnet_c_test" {
  vpc_id                  = aws_vpc.main_vpc_test.id
  cidr_block              = "172.32.32.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-c-test"
  }
}