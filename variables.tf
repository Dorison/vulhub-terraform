variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_ami" {
  description = "AMI"
  type        = string
}

variable "instance_type" {
  description = "EC type"
  type        = string
}

variable "key_name" {
  description = "Name of SSH KEY"
  type        = string
}
