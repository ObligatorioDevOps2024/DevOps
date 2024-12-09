# Internet Gateway para test
resource "aws_internet_gateway" "igw_test" {
  vpc_id = aws_vpc.main_vpc_test.id

  tags = {
    Name = "test-vpc-igw"
  }
}

# Route Table para test
resource "aws_route_table" "public_rt_test" {
  vpc_id = aws_vpc.main_vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_test.id
  }

  tags = {
    Name = "test-public-route-table"
  }
}

# Asociaciones de Route Table para test
resource "aws_route_table_association" "subnet_a_association_test" {
  subnet_id      = aws_subnet.subnet_a_test.id
  route_table_id = aws_route_table.public_rt_test.id
}

resource "aws_route_table_association" "subnet_b_association_test" {
  subnet_id      = aws_subnet.subnet_b_test.id
  route_table_id = aws_route_table.public_rt_test.id
}

resource "aws_route_table_association" "subnet_c_association_test" {
  subnet_id      = aws_subnet.subnet_c_test.id
  route_table_id = aws_route_table.public_rt_test.id
}