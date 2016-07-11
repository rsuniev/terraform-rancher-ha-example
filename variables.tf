#------------------------------------------#
# AWS Environment Values
#------------------------------------------#
variable "access_key" {
    description = "AWS account access key ID"
}

variable "secret_key" {
    description = "AWS account secret access key"
}

variable "region" {
    default     = "eu-west-1"
    description = "The region of AWS, for AMI lookups."
}

variable "ami" {
    description = "AWS RancherOS AMI ID"
    default {
        eu-west-1 = "ami-8b74e0f8"
        eu-west-1 = "ami-8b74e0f8"
        eu-west-2 = "ami-e4ef038b"
    }
}

variable "key_name" {
    default = "rancher-example"
    description = "SSH key name in your AWS account for AWS instances."
}

variable "key_path" {
    default = "~/.ssh/rancher-example"
    description = "Local path of the SSH private key"
}

variable "instance_type" {
    default     = "t2.large" # RAM Requirements >= 8gb
    description = "AWS Instance type"
}

variable "tag_name" {
    default     = "rancher-ha"
    description = "Name tag for the servers"
}

variable "vpc_cidr" {
    default     = "192.168.99.0/24"
    description = "Subnet in CIDR format to assign to VPC"
}

variable "db_port" {
  description = "The port for the database [3306]"
  default = 3306
}

variable "db_password" {
    description = "Password for connecting to the rancher RDS database"
}

variable "db_name" {
  description = "The name for the database [rancher]"
  default = "rancher"
}

variable "db_username" {
  description = "The username for the database [rancher]"
  default = "rancher"
}

variable "rancher_image" {
  description = "The Docker image to run Rancher from"
  default = "rancher/server:v1.1.0"
}

variable "rancher_username" { default = "rancher" }

variable "cert_body" {}
variable "cert_private_key" {}
variable "cert_chain" {}
