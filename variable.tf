variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_subnet_nginx" {
  default = "192.168.1.0/24"
}

variable "private_subnet_tomcat" {
  default = "192.168.2.0/24"
}

variable "private_subnet_db" {
  default = "192.168.3.0/24"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0f58b397bc5c1f2e8" # Use latest Amazon Linux 2 AMI for your region
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Your EC2 Key Pair name"
  default     = "3-tier-key" # Replace with your actual key name
}
