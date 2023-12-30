output "ec2_dev_public_ip_1" {
  value = aws_instance.Node-One.public_ip
  # value = var.env == "dev" ? aws_instance.Node-One.public_ip : "not required"
}

output "ec2_dev_public_ip_2" {
  value = aws_instance.Node-Two.public_ip
  # value = var.env == "sit" ? aws_instance.Node-Two.public_ip : "not required"
}

output "ec2_dev_public_ip_3" {
  value = aws_instance.Monitoring-Machine.public_ip
  # value = var.env == "sit" ? aws_instance.Node-Two.public_ip : "not required"
}
