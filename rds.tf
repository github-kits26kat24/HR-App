# resource "aws_db_subnet_group" "hr-app" {
#   name        = "hr-app"
#   description = "RDS subnet group"
#   subnet_ids  = [aws_subnet.Node-One.id, aws_subnet.Node-Two.id]
# }
# resource "aws_db_parameter_group" "hr-app-pg" {
#   name   = "hr-app-parameter"
#   family = "mariadb10.3"

#   parameter {
#     name  = "max_allowed_packet"
#     value = "16777216"
#   }
# }
# resource "aws_db_instance" "mariadb" {
#   allocated_storage      = 5 # 100 GB of storage, gives us more IOPS than a lower number
#   engine                 = "mariadb"
#   engine_version         = "10.3"
#   instance_class         = "db.t2.micro" # use micro if you want to use the free tier
#   identifier             = "mariadb"
#   db_name                = "mydatabase"  # database name
#   username               = "kits-hr-app" # var.RDS_USERNAME # username
#   password               = "hrapprds"    # var.RDS_PASSWORD # password
#   db_subnet_group_name   = aws_db_subnet_group.hr-app.name
#   parameter_group_name   = aws_db_parameter_group.hr-app-pg.name
#   multi_az               = "false" # set to true to have high availability: 2 instances synchronized with each other
#   vpc_security_group_ids = [aws_security_group.hr-app-sg.id]
#   storage_type           = "gp2" # ?
#   #backup_retention_period   = 30                                          # how long you’re going to keep your backups
#   # availability_zone         = [aws_subnet.private.availability_zone] # prefered AZ
#   final_snapshot_identifier = "mariadb-final-snapshot" # final snapshot when executing terraform destroy
#   skip_final_snapshot       = "false"                  # false If you want a snapshot of the RDS instance before it gets destroyed and recreated
#   tags = {
#     Name = "hr-app-engine"
#   }
# }