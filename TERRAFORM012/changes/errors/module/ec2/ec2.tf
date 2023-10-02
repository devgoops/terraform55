resource "aws_instance" "ec2" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = var.type
}