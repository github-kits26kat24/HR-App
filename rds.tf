# create the subnet group for the rds instance
resource "aws_db_subnet_group" "hr-subnet_group" {
  name        = "hr-database_subnets"
  subnet_ids  = [aws_subnet.Node-One.id, aws_subnet.Node-Two.id, aws_subnet.Monitoring-Machine.id]
  description = "subnet for database instance"
  tags = {
    Name = "hr-database"
  }
}

# use data source to get all available zones in the region
data "aws_availability_zones" "available_zones" {}

# create the rds instance
resource "aws_db_instance" "hr-app-db_instance" {
  engine                 = "postgres"
  engine_version         = "15.3"
  multi_az               = false
  identifier             = "hr-app-project"
  username               = "kitskatrds"
  password               = "kitskat2023"
  instance_class         = "db.t3.micro"
  allocated_storage      = 400
  db_subnet_group_name   = aws_db_subnet_group.hr-subnet_group.name
  vpc_security_group_ids = [aws_security_group.hr-sg.id]
  availability_zone      = data.aws_availability_zones.available_zones.names[0]
  db_name                = "mydatabase"
  publicly_accessible    = true
  skip_final_snapshot    = true
}
