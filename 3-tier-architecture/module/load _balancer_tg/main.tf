resource "aws_lb_target_group" "webserver_alb_target_group" {
  name     = var.alb-target-group-name
  port     = var.alb-target-group-port
  protocol = var.alb-target-group-protocol
  vpc_id   = var.alb-target-group-vpc-id
}
