provider "aws" {
    region = "us-east-1"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Name for Module"

}

output "instance_id" {
    value = module.ec2module.instance_id 
}  
