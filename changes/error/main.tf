provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-00eaf71a6fc9b8449"
    instance_type = var.type
}