resource "aws_internet_gateway" "hr-app-gw" {
  vpc_id     = aws_vpc.hr-app.id
  depends_on = [aws_vpc.hr-app]

  tags = {
    Name = "main-hr-app"
  }
}