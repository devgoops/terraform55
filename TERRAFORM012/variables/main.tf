variable "vpcname" {
    type = string
    default = "vpc-dev"
}

variable "sshport" {
    type = number
    default = 22
}

variable enabled { 
    default = true
}


variable "mylist" {
    type = list(string)
    default = ["value1", "value2"]
}

variable "mymap" { 
    type = map
    default = {
        Key1 = "Value1",
        Key2 = "Value2"
    }
}

variable "inputname" {
    type = string
    description = "Setting the name of the VPC"
}
resource "aws_vpc" "vpc-dev" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = var.inputname   
    }
}

output "vpcid" {
    value = aws_vpc.vpc-dev.id
}

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["cat", 1, "dog"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default {
        name = "AS"
        port = [22, 25, 80]
    }
}