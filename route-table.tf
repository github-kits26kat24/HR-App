resource "aws_route_table" "hr-rt" {
  vpc_id = aws_vpc.hr-app.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hr-gw.id
  }

  tags = {
    Name = "hr-rt"

  }
}