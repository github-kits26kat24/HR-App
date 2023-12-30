resource "aws_instance" "Node-One" {

  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  subnet_id                   = aws_subnet.Node-One.id
  vpc_security_group_ids      = [aws_security_group.hr-app-sg.id]
  tags                        = var.dev_default_tags_1 # var.ec2_name_1
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }
}

resource "aws_instance" "Node-Two" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  subnet_id                   = aws_subnet.Node-Two.id
  vpc_security_group_ids      = [aws_security_group.hr-app-sg.id]
  tags                        = var.dev_default_tags_2 # var.ec2_name_2
  associate_public_ip_address = true

  # root_block_device {
  #   volume_size           = 8
  #   delete_on_termination = true
  # }
}

resource "aws_instance" "Monitoring-Machine" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  subnet_id                   = aws_subnet.Monitoring-Machine.id
  vpc_security_group_ids      = [aws_security_group.hr-app-sg.id]
  tags                        = var.dev_default_tags_3 # var.ec2_name_2
  associate_public_ip_address = true

  # root_block_device {
  #   volume_size           = 8
  #   delete_on_termination = true
  # }
}