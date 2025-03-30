resource "aws_lb" "webserver_lb" {
  name               = var.webserver_lb_name
  internal           = var.webserver_lb_is_internal
  load_balancer_type = var.webserver_lb_type
  security_groups    = [var.webserver_sg_id]
  subnets            = [var.webserver_subnets_1_id, var.webserver_subnets_2_id]

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Environment = "dev"
  }
}