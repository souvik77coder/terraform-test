provider "aws" {
    region = "us-west-2"
  
}

variable "myvpcname" {
    type = string
    default = "myvpc"
  
}

variable "port" {
    type = number
    default = 10
}

variable "enabled" {
  type = bool
  default = true
}

variable "list" {
    type = list(string)
    default = [ "Value1", "Value2" ]
}

variable "map" {
    type = map
    default = {
      key1 = "value1"
      key2 = "value2"
    }
}

variable "inputname" {

type = string
description = "the name of vpc" 
  
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true

  tags = {
    Name = var.inputname
  }
}

output "vpcid" {
  value = aws_vpc.vpc.id
}