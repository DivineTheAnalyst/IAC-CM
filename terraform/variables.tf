variable "instance_count" {
    description = "Numbers of instances to create"
    default = 1
}

variable "region" {
    description = "aws region to deploy resources"
    default = "us-east-1"
}

variable "server_count" {
    default = 2 
}

variable "ansible_user" {
    default = "ubuntu"
}

variable "ssh_private_key" {
  description = "Path to SSH private key"
  type        = string
  default     = "~/.ssh/divinekey.pem"  # Change to your actual key pair path
}
