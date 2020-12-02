resource "aws_lb" "Webservers_loadbalancer" {
  name                             = "Webserversloadbalancer"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [aws_security_group.Loadbalancer_security_group.id]
  drop_invalid_header_fields       = true
  enable_cross_zone_load_balancing = true

  # Give Webservers_loadbalancer as IP
  subnet_mapping {
    subnet_id = aws_subnet.Loadbalancer_public_subnet_1b.id
    /*  allocation_id = aws_eip.Webservers_loadbalancer_eip.id*/
  }

  # Give Webservers_loadbalancer as IP
  subnet_mapping {
    subnet_id = aws_subnet.Loadbalancer_public_subnet_1c.id
    /*allocation_id = aws_eip.Webservers_loadbalancer_eip.id*/
  }

  tags = {
    Name = "Webservers_loadbalancer"
  }
}

output "Loadbalancer_dns" {
  value = aws_lb.Webservers_loadbalancer.dns_name
}