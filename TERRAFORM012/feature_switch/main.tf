provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  count         = var.environment == "prod" ? 1 : 0
}