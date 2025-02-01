provider "aws" {
    region = "us-east-1"
}

module "server" {
    source = "./server"
    vpc_cidr_block_ip = var.vpc_cidr_block_ip
    subnet_cidr_block_ip = var.subnet_cidr_block_ip
    availability_zone = var.availability_zone
    instance_ami = var.instance_ami
    instance_type = var.instance_type
    sg_name = var.sg_name
} 

