# Creating A Subnet 
# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/subnet

resource "aws_subnet" "Node-One" {
  vpc_id                  = aws_vpc.hr-app.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  depends_on              = [aws_vpc.hr-app]
  # AZ for the subnet.

  availability_zone = "eu-west-1a"
  tags = {
    Name = "Node_One"
  }
}
resource "aws_subnet" "Node-Two" {
  vpc_id                  = aws_vpc.hr-app.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  depends_on              = [aws_vpc.hr-app]
  # AZ for the subnet.

  availability_zone = "eu-west-1b"
  tags = {
    Name = "Node_Two"
  }
}
resource "aws_subnet" "Monitoring-Machine" {
  vpc_id                  = aws_vpc.hr-app.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  depends_on              = [aws_vpc.hr-app]
  # AZ for the subnet.

  availability_zone = "eu-west-1c"
  tags = {
    Name = "Monitoring-Machine"
  }
}