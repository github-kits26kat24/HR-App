resource "aws_internet_gateway" "hr-gw" {
  vpc_id     = aws_vpc.hr.id
  depends_on = [aws_vpc.hr]

  tags = {
    Name = "main-hr-gw"
  }
}