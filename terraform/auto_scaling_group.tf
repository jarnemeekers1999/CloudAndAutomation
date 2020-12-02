resource "aws_autoscaling_group" "webservers_auto_scaling_group" {
  name                      = "webservers_auto_scaling_group"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  vpc_zone_identifier       = [aws_subnet.Webserver_private_subnet_1b.id, aws_subnet.Webserver_private_subnet_1c.id]
  target_group_arns         = [aws_lb_target_group.elb_target_group.arn]


  launch_template {
    id = aws_launch_template.webservers_launch_template.id
  }

  tags = [{
    Name = "webservers_auto_scaling_group"
  }]

}