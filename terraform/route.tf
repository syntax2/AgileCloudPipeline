resource "aws_route_table" "public_route" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.internet_gateway_id
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = module.vpc.nat_gateway_id
  }
}

resource "aws_route_table_association" "ass_1" {
  route_table_id = aws_route_table.public_route.id
  subnet_id      = module.vpc.private_subnets[0]
}

resource "aws_route_table_association" "ass_1" {
  route_table_id = aws_route_table.public_route.id
  subnet_id      = module.vpc.private_subnets[1]
}
resource "aws_route_table_association" "ass_2" {
  route_table_id = aws_route_table.private_route.id
  subnet_id      = module.vpc.public_subnets[0]
}
resource "aws_route_table_association" "ass_2" {
  route_table_id = aws_route_table.private_route.id
  subnet_id      = module.vpc.public_subnets[1]
}
