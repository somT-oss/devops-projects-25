variable "vpc_cidr_block_ip" {
    type = string
    default = "172.16.0.0/16"
}

variable "subnet_cidr_block_ip" {
    type = string 
    default = "172.16.10.0/24"
}

variable "availability_zone" {
    type = string
    default = "us-east-1a"
}

variable "instance_ami" {
    type = string
    default = "ami-0c614dee691cbbf37"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "sg_name" {
    type = string
    default = "webserver_sg"
}