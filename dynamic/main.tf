provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  
  ami = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.Webtraffic.name]
}

variable "ingressrules" {

    type = list(number)
    default = [80,443]
  
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
  
}
resource "aws_security_group" "Webtraffic" {

    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
}