variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 key name"
}

variable "vpc_id" {
}

variable "subnet_id" {
  
}

variable "name" {
  default = ""
}
