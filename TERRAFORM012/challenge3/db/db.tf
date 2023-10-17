provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "db" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"


  tags = {
    Name = "Db Server"
  }

}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}

