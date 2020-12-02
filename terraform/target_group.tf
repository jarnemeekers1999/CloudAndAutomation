resource "aws_lb_target_group" "elb_target_group" {
  name     = "elb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Webapp_vpc.id

  tags = {
    Name = "Webservers_loadbalancer_target_group"
  }
}