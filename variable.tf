
variable "ec2_ami" {
  description = "This is a variable to manage ec2 AMI type"
  type        = string
  default     = "ami-02cad064a29d4550c"
}

variable "ec2_instance_type" {
  description = "This is a variable to manage ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "This is a variable to manage ec2 key name"
  type        = string
  default     = "Kitskat2023"
}

variable "sg_name" {
  description = "This is a variable to manage ec2 key name"
  type        = string
  default     = "hr-app-sg"
}

variable "subnet" {
  description = "This is a variable to manage ec2 key name"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.2.0/24"]
}

variable "availability_zone" {
  description = "This is a variable to manage ec2 key name"
  type        = list(any)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1b"]
}

variable "availability_zones" {
  description = "This is a variable to manage RDS name"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "ec2_dev_public_ip_1" {
  description = "This is a variable to manage ec2 dev_public_ip_1 name"
  type        = string
  default     = "aws_instance.Node-One.public_ip"
}
variable "ec2_dev_public_ip_2" {
  description = "This is a variable to manage ec2 dev_public_ip_2 name"
  type        = string
  default     = "aws_instance.Node-Two.public_ip"
}

variable "ec2_dev_public_ip_3" {
  description = "This is a variable to manage ec2 dev_public_ip_3 name"
  type        = string
  default     = "aws_instance.Monitoring-Machine.public_ip"
}

variable "dev_default_tags_1" {
  description = "This variable is declared here to manage ec2 tags"
  type        = map(any)
  default = {
    "Name"        = "Node_One"
    "Dept"        = "Accounting-Node-One"
    "can destroy" = "yes"
  }
}

variable "dev_default_tags_2" {
  description = "This variable is declared here to manage ec2 tags"
  type        = map(any)
  default = {
    "Name"        = "Node_Two"
    "Dept"        = "Finance-Node-Two"
    "can destroy" = "yes"
  }
}
variable "dev_default_tags_3" {
  description = "This variable is declared here to manage ec2 tags"
  type        = map(any)
  default = {
    "Name"        = "Monitoring-Machine"
    "Dept"        = "DataBase-Node-Three"
    "can destroy" = "yes"
  }
}

variable "bucket" {
  description = "This is a variable to manage ec2 bucket name"
  type        = string
  default     = "hr-app-project-bucket"
}

variable "key" {
  description = "This is a variable to manage ec2 bucket name"
  type        = string
  default     = "dev/terraform.tfstate"
}

variable "RDS_PASSWORD" {
  description = "This is a variable to manage ec2 sit_public_ip_3 name"
  type        = string
  default     = "kitskat2023"
}

variable "RDS_USERNAME" {
  description = "This is a variable to manage ec2 sit_public_ip_3 name"
  type        = string
  default     = "kitskatrds"
}

# variable "bucket" {}
# variable "key" {}
# variable "env" {}

# variable "ec2_name_1" {}
# variable "ec2_name_2" {}
# variable "ec2_name_3" {}
# variable "sg_name" {}
# variable "ec2_key_name" {}
# variable "ec2_instance_type" {}
# variable "default_tags" {}
# variable "ec2_ami" {}
# variable "aws_region" {}
# variable "RDS_PASSWORD" {}
# variable "RDS_USERNAME" {}

# variable "env" {
#   description = "This is a variable to manage ec2 env name"
#   type        = string
#   default     = "dev"
# }
