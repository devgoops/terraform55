# data "aws_vpc" "vpc-dev" {
#   filter {
#     name   = "tag:Name"
#     values = ["TerraformVPC"]
#   }
# }

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami             = "ami-0fc5d935ebf8bc3bc"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webport.name]
}

resource "aws_security_group" "webport" {
  name   = "Allow HTTPS"
#   vpc_id = data.aws_vpc.vpc-dev.id
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "TCP"
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "TCP"
  }


}