provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  
  ami = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"
}