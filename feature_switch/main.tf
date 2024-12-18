provider "aws" {
    region = "us-west-2"
}

variable "environment" {
  type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-00eaf71a6fc9b8449"
    instance_type = "t4g.micro"
    count = var.environment == "prod" ? 1 : 0
}