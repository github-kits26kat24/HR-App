//This is the security group for the development environment
# Creating SECURITY GROUP
# Resource: aws_security_group
# https://registry.terraform.io/providers/hashicorp/aws/3.73.0/docs/resources/security_group

//This is the security group for the development environment

resource "aws_security_group" "hr-app-sg" {
  name        = var.sg_name
  description = "Allow SSH and HTTP Connection"
  vpc_id      = aws_vpc.hr-app.id
  ingress {
    description = "SSH from VPC"
    from_port   = 22 //ssh always connect on port 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80 //Http always connect from port 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 3306 //Http always connect from port 80
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 5432 //Http always connect from port 80
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}