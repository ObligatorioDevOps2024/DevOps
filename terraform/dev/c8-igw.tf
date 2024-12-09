# Internet Gateway para dev
resource "aws_internet_gateway" "igw_dev" {
  vpc_id = aws_vpc.main_vpc_dev.id

  tags = {
    Name = "dev-vpc-igw"
  }
}

# Route Table para dev
resource "aws_route_table" "public_rt_dev" {
  vpc_id = aws_vpc.main_vpc_dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_dev.id
  }

  tags = {
    Name = "dev-public-route-table"
  }
}

# Asociaciones de Route Table para dev
resource "aws_route_table_association" "subnet_a_association_dev" {
  subnet_id      = aws_subnet.subnet_a_dev.id
  route_table_id = aws_route_table.public_rt_dev.id
}

resource "aws_route_table_association" "subnet_b_association_dev" {
  subnet_id      = aws_subnet.subnet_b_dev.id
  route_table_id = aws_route_table.public_rt_dev.id
}

resource "aws_route_table_association" "subnet_c_association_dev" {
  subnet_id      = aws_subnet.subnet_c_dev.id
  route_table_id = aws_route_table.public_rt_dev.id
}
