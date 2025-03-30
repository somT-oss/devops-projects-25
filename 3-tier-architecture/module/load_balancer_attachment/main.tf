resource "aws_lb_target_group_attachment" "webserver_lb_target_group_attachment" {
  target_group_arn = var.alb_target_group_arn
  target_id        = var.webserver_id
  port             = var.alb_target_group_attachment_port
}
