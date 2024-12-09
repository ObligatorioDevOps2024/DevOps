# Internet Gateway para prod
resource "aws_internet_gateway" "igw_prod" {
  vpc_id = aws_vpc.main_vpc_prod.id

  tags = {
    Name = "prod-vpc-igw"
  }
}

# Route Table para prod
resource "aws_route_table" "public_rt_prod" {
  vpc_id = aws_vpc.main_vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_prod.id
  }

  tags = {
    Name = "prod-public-route-table"
  }
}

# Asociaciones de Route Table para prod
resource "aws_route_table_association" "subnet_a_association_prod" {
  subnet_id      = aws_subnet.subnet_a_prod.id
  route_table_id = aws_route_table.public_rt_prod.id
}

resource "aws_route_table_association" "subnet_b_association_prod" {
  subnet_id      = aws_subnet.subnet_b_prod.id
  route_table_id = aws_route_table.public_rt_prod.id
}

resource "aws_route_table_association" "subnet_c_association_prod" {
  subnet_id      = aws_subnet.subnet_c_prod.id
  route_table_id = aws_route_table.public_rt_prod.id
}