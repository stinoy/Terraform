variable "aws_region" {
  description = "AWS Region where AD will be deployed"
  type        = string
}

variable "directory_dns_name" {
  description = "The fully qualified DNS name for the AWS Managed Microsoft AD"
  type        = string
}

variable "directory_netbios_name" {
  description = "The NetBIOS name for the directory"
  type        = string
}

variable "admin_password" {
  description = "The password for the directory administrator"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "The VPC ID where the directory service will be deployed"
  type        = string
}

variable "subnet_1" {
  description = "First subnet for the directory service"
  type        = string
}

variable "subnet_2" {
  description = "Second subnet for the directory service"
  type        = string
}
