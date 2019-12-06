variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-2"
}
variable "zone" {
  description = "Availability Zone?"
  default     = "a"
}
variable "vpc_id" {
  description = "VPC id"
}
variable "instance_count" {
  description = "Instance Count?"
  default     = 1
}
variable "instance_type" {
  description = "Instance Type"
  default     = "t2.micro"
}
variable "ebs_optimized" {
  description = "EBS optimized"
  default     = false
}
variable "associate_public_ip_address" {
  description = "Public IP?"
  default     = true
}
variable "monitoring" {
  description = "Monitoring?"
  default     = true
}
variable "disable_api_termination" {
  description = "Termination protection?"
  default     = true
}
variable "key_name" {
  description = "Key Name"
}
variable "service" {
  description = "Service"
  default     = "Test"
}
variable "role" {
  description = "Role"
  default     = "Test"
}
variable "vpc_security_group_ids" {
  type        = "list"
  description = "VPC Security Group"
  default     = ["default"]
}
variable "block_device" {
  type = "map"
  default = {
    volume_size = 30
  }
}
//variable "amis" {
//  type = "map"
//  default = {
//    eu-west-1 = "ami-0404b890c57861c2d"
//    eu-west-2 = "ami-0fb2dd0b481d4dc1a"
//  }
//}