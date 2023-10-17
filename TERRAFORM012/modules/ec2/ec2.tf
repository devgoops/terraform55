variable "ec2name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
}

output "instance_id" {
    value = aws_instance.ec2.id
}