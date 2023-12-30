# Create a VPC
resource "aws_vpc" "hr-app" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  # ... other VPC settings ...
  enable_dns_support   = true
  enable_dns_hostnames = true
}