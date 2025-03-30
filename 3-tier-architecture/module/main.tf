provider "aws" {
    region = "us-east-1"
}

module "server" {
    source = "./server"
    vpc_cidr_block_ip = var.vpc_cidr_block_ip
    subnet_1_cidr_block_ip = var.subnet_1_cidr_block_ip
    subnet_2_cidr_block_ip = var.subnet_2_cidr_block_ip
    availability_zone_1= var.availability_zone_1
    availability_zone_2 = var.availability_zone_2
    instance_ami = var.instance_ami
    instance_type = var.instance_type
    sg_name = var.sg_name
} 

module "load_balancer_tg" {
    source = "./load _balancer_tg"
    alb-target-group-name = var.alb-target-group-name
    alb-target-group-port = var.alb-target-group-port
    alb-target-group-protocol = var.alb-target-group-protocol
    alb-target-group-vpc-id = module.server.server_vpc_id
}

module "load_balancer_group_attachment" {
    source = "./load_balancer_attachment"
    alb_target_group_arn = module.load_balancer_tg.webserver_load_balancer_tg_arn
    alb_target_group_attachment_port = var.alb-target-group-port
    webserver_id = module.server.webserver_id
}

module "application_load_balancer" {
    source = "./application_load_balancer"
    webserver_lb_name = var.webserver_lb_name
    webserver_lb_is_internal = var.webserver_lb_is_internal
    webserver_lb_type = var.webserver_lb_type
    webserver_sg_id = module.server.webserver_sg_id
    webserver_subnets_1_id = module.server.webserver_subnet_1_id 
    webserver_subnets_2_id = module.server.webserver_subnet_2_id
    enable_deletion_protection = var.enable_deletion_protection
}

module "load_balancer_listener" {
    source = "./load_balancer_listener"
    webserver_alb_arn = module.application_load_balancer.webserver_lb_arn
    webserver_alb_port = var.alb-target-group-port
    webserver_alb_listener_type = var.webserver_alb_listener_type
    webserver_alb_protocol = var.alb-target-group-protocol
    webserver_alb_tg_arn = module.load_balancer_tg.webserver_load_balancer_tg_arn
}