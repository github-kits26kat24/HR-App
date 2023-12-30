# Create a AWS Plugin
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "hr-app-project-bucket"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
    # dynamodb_table = "hr-app-dynamo-table"
  }
}

provider "aws" {
  region = "eu-west-1"
}

#   resource "tls_private_key" "rsa_4096" {
#     algorithm = "RSA"
#     rsa_bits  = 4096
#   }

#   variable "key_name" {
#     description = "Name of the SSH key pair"
#   }

#   # Create Key Pair  For Connecting EC2 Via SSH
#   resource "resource "aws_key_pair" "key_pair" {
#     key_name = var.key_name 
#     public_key = tls_private_key.rsa_4096.public_key_openssh
#   }

#   # Save PEM File Locally
#   resource "local_file" "private_key"[
#     content = tls_private_key.rsa_4096.private_key_pem
#     filename = var.key_name
#   ]

#   provisioner " local-exec" {
# command = "chmod 400 ${var.key_name}"
# }


# Configure the AWS Provider
