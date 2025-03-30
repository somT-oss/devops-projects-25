resource "aws_lb_listener" "webserver_alb_listener" {
  load_balancer_arn = var.webserver_alb_arn
  port              = var.webserver_alb_port
  protocol          = var.webserver_alb_protocol

  default_action {
    type             = var.webserver_alb_listener_type
    target_group_arn = var.webserver_alb_tg_arn
  }
}