variable "aws_region" {
  description = "AWS region for the lab resources"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Short resource naming prefix"
  type        = string
  default     = "jenkins-freestyle-cicd"
}

variable "ami_id" {
  description = "A current, compatible Linux AMI ID in aws_region; choose and verify it yourself"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type suitable for the chosen workload"
  type        = string
  default     = "t3.small"
}

variable "key_pair_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "admin_cidr" {
  description = "Your trusted public IPv4 address in CIDR notation, e.g. 203.0.113.10/32"
  type        = string
  validation {
    condition     = can(cidrhost(var.admin_cidr, 0))
    error_message = "admin_cidr must be a valid IPv4 CIDR range."
  }
}
