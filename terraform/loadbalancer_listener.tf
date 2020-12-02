resource "aws_lb_listener" "Webservers_loadbalancer_listener" {
  load_balancer_arn = aws_lb.Webservers_loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb_target_group.arn
  }
}