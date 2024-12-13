provider "aws" {
    region = "us-west-2"
}


module "ec2" {
    source = "./ec2"
    ami    = "ami-00eaf71a6fc9b8449"
    for_each = toset([ "dev", "test", "prod" ])
}