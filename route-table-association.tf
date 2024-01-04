resource "aws_route_table_association" "hr-rta-1" {
  subnet_id      = aws_subnet.Node-One.id
  route_table_id = aws_route_table.hr-rt.id
}

resource "aws_route_table_association" "hr-rta-2" {
  subnet_id      = aws_subnet.Node-Two.id
  route_table_id = aws_route_table.hr-rt.id
}

resource "aws_route_table_association" "hr-rta-3" {
  subnet_id      = aws_subnet.Monitoring-Machine.id
  route_table_id = aws_route_table.hr-rt.id
}
