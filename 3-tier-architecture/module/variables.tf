variable "vpc_cidr_block_ip" {
    type = string
    default = "10.0.0.0/16"  
}

variable "subnet_1_cidr_block_ip" {
    type = string 
    default = "10.0.1.0/24"
}

variable "subnet_2_cidr_block_ip" {
    type = string
    default = "10.0.2.0/24"
}

variable "availability_zone_1" {
    type = string 
    default = "us-east-1a"
}

variable "availability_zone_2" {
    type = string
    default = "us-east-1b"
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

variable "alb-target-group-name" {
    type = string
    default = "webserver-alb-target-group" 
}

variable "alb-target-group-port" {
    type = number
    default = 80
}

variable "alb-target-group-protocol" {
    type = string
    default = "HTTP"
}

variable "webserver_lb_name" {
    type = string
    default = "webserver-lb"
}

variable "webserver_lb_is_internal" {
    type = bool
    default = false
}

variable "webserver_lb_type" {
    type = string
    default = "application"
}

variable "enable_deletion_protection" {
    type = bool
    default = true
}

variable "webserver_alb_listener_type" {
    type = string
    default = "forward"
}