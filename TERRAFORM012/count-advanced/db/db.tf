variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }

}

output "PrivateIP" {
  value = aws_instance.db.*.private_ip
}

