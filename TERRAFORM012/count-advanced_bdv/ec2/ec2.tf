resource "aws_instance" "ec2" {
  for_each = toset(var.server_names)
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name = "advinha"
  security_groups = [aws_security_group.ec2_group.name]

  user_data = <<-EOF
            #!/bin/bash
            set -e          
            # Ouput all log(s) to /var/log/user-data.log (CloudWatch Logs 
            exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
            echo "Hello, World" > /var/tmp/hello.txt
            echo "export APP_NAME=${each.value}-server" >> /etc/profile
            source /etc/profile
            # Adicione mais comandos de inicialização conforme necessário
            a
            EOF
  tags = {
    Name = "${each.value}-server"
  }

}

output "PrivateIP" {
  value = [for instance in aws_instance.ec2 : instance.private_ip]
}

output "PublicIP" {
  value = [for instance in aws_instance.ec2 : instance.public_ip]
}





resource "aws_security_group" "ec2_group" {
  name = "ec2-group"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
