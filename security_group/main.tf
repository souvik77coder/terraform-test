provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  
  ami = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.Webtraffic.name]
}

resource "aws_security_group" "Webtraffic" {

    name = "Allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress{
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }
}