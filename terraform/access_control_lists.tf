#Bastion_host_public_subnet ACL

resource "aws_network_acl" "Bastion_host_public_subnet_ACL" {
  vpc_id     = aws_vpc.Webapp_vpc.id
  subnet_ids = [aws_subnet.Bastion_host_public_subnet.id]

  # Allow Jonas SSH traffic to Bastion_host_public_subnet
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.Jonas_public_ip
    from_port  = 22
    to_port    = 22
  }

  # Allow Jarne SSH traffic to Bastion_host_public_subnet
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = var.Jarne_public_ip
    from_port  = 22
    to_port    = 22
  }

  # Allow PXL SSH traffic to Bastion_host_public_subnet
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "193.190.154.173/32"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "193.190.154.174/32"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "193.190.154.175/32"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "193.190.154.176/32"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32768
    to_port    = 65535
  }


  # Allow Bastion_host_public_subnet SSH traffic to Webserver_private_subnet_1b and Webserver_private_subnet_1c

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 22
    to_port    = 22
  }

  #allow return traffic to windows 10 clients
  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.Jonas_public_ip
    from_port  = 32768 #49152-65535 is the ephemeral port range for windows 10 clients
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = var.Jarne_public_ip
    from_port  = 32768 #49152-65535 is the ephemeral port range for windows 10 clients
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "193.190.154.173/32"
    from_port  = 1024 #49152-65535 is the ephemeral port range for windows 10 clients
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "193.190.154.174/32"
    from_port  = 1024 #49152-65535 is the ephemeral port range for windows 10 clients
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "193.190.154.175/32"
    from_port  = 1024 #49152-65535 is the ephemeral port range for windows 10 clients
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "193.190.154.176/32"
    from_port  = 1024 #32768-65535 is the ephemeral port range for windows 10 clients
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 180
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 190
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  tags = {
    Name = "Bastion_host_public_subnet_ACL"
  }
}

#Loadbalancer_public_subnet_1b and Loadbalancer_public_subnet_1c ACL
resource "aws_network_acl" "Loadbalancer_public_subnet_1_ACL" {
  vpc_id     = aws_vpc.Webapp_vpc.id
  subnet_ids = [aws_subnet.Loadbalancer_public_subnet_1b.id, aws_subnet.Loadbalancer_public_subnet_1c.id]

  #allow HTTP access from webservers and internet  
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.Jonas_public_ip
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = var.Jarne_public_ip
    from_port  = 80
    to_port    = 80
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "193.190.154.173/32"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "193.190.154.174/32"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "193.190.154.175/32"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "193.190.154.176/32"
    from_port  = 80
    to_port    = 80
  }

  # allow HTTPS access from webservers and internet
  ingress {
    protocol   = "tcp"
    rule_no    = 180
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 190
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.Jonas_public_ip
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 210
    action     = "allow"
    cidr_block = var.Jarne_public_ip
    from_port  = 443
    to_port    = 443
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 220
    action     = "allow"
    cidr_block = "193.190.154.173/32"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 230
    action     = "allow"
    cidr_block = "193.190.154.174/32"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 240
    action     = "allow"
    cidr_block = "193.190.154.175/32"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "allow"
    cidr_block = "193.190.154.176/32"
    from_port  = 443
    to_port    = 443
  }

  # allow return traffic from webservers to internet
  ingress {
    protocol   = "tcp"
    rule_no    = 260
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 32768
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 270
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 32768
    to_port    = 65535
  }

  # Allow Bastion_host_public_subnet SSH traffic to Jonas
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = var.Jonas_public_ip
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }
  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = var.Jarne_public_ip
    from_port  = 32768
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "193.190.154.173/32"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "193.190.154.174/32"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 180
    action     = "allow"
    cidr_block = "193.190.154.175/32"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 190
    action     = "allow"
    cidr_block = "193.190.154.176/32"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "Loadbalancer_public_subnet_1_ACL"
  }
}

#Webserver_private_subnet_1b ACL and Webserver_private_subnet_1c ACL

resource "aws_network_acl" "Webserver_private_subnet_1_ACL" {
  vpc_id     = aws_vpc.Webapp_vpc.id
  subnet_ids = [aws_subnet.Webserver_private_subnet_1b.id, aws_subnet.Webserver_private_subnet_1c.id]

  # Allow Bastion_host_public_subnet to SSH to Webserver_private_subnet_1b and Webserver_private_subnet_1c
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${aws_instance.bastion_host.private_ip}/32"
    from_port  = 22
    to_port    = 22
  }

  # Allow Loadbalancer_public_subnet_1b and Loadbalancer_public_subnet_1c HTTP AND HTTPS access to Webserver_private_subnet_1b and Webserver_private_subnet_1c
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.1.0/24"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "172.31.2.0/24"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "172.31.1.0/24"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "172.31.2.0/24"
    from_port  = 443
    to_port    = 443
  }

  #return traffic for HTTP and HTTPS over ipv6 via egress only gateway
  ingress {
    protocol        = "tcp"
    rule_no         = 150
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 32768 #ephemeral ports windows and linux hosts
    to_port         = 65535
  }

  #Outgoing http requests over ipv4 for webservers return traffic and database return traffic
  ingress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32768
    to_port    = 65535
  }

  # Return traffic to loadbalancer and internet

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${aws_instance.bastion_host.private_ip}/32"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.1.0/24"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "172.31.2.0/24"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = var.Jonas_public_ip
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = var.Jarne_public_ip
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "193.190.154.173/32"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "193.190.154.174/32"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "193.190.154.175/32"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 180
    action     = "allow"
    cidr_block = "193.190.154.176/32"
    from_port  = 32768 #32768-65535 is the ephemeral port range for windows and linux hosts
    to_port    = 65535
  }

  # HTTP traffic from webservers over IPv6 via egress only gateway
  egress {
    protocol        = "tcp"
    rule_no         = 190
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 80
    to_port         = 80
  }
  # HTTPS traffic from webservers over IPv6 via egress only gateway
  egress {
    protocol        = "tcp"
    rule_no         = 200
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 443
    to_port         = 443
  }
  # HTTP traffic from webserver to outside
  egress {
    protocol   = "tcp"
    rule_no    = 210
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  #Outgoing connections to RDS database
  egress {
    protocol   = "tcp"
    rule_no    = 220
    action     = "allow"
    cidr_block = "172.31.5.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  egress {
    protocol   = "tcp"
    rule_no    = 230
    action     = "allow"
    cidr_block = "172.31.6.0/24"
    from_port  = 3306
    to_port    = 3306
  }
  tags = {
    Name = "Webserver_private_subnet_1_ACL"
  }
}

#Database_private_subnet_1d ACL and Database_private_subnet_1e

resource "aws_network_acl" "Database_private_subnet_1" {
  vpc_id     = aws_vpc.Webapp_vpc.id
  subnet_ids = [aws_subnet.Database_private_subnet_1d.id, aws_subnet.Database_private_subnet_1e.id]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    protocol        = "tcp"
    rule_no         = 120
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 32768
    to_port         = 65535
  }

  /*  			ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    ipv6_cidr_block = "::/0"
    from_port  = 443
    to_port    = 443
  }*/

  # Allow Database_private_subnet_1d access to MySQL database
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.31.3.0/24"
    from_port  = 32768
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.31.4.0/24"
    from_port  = 32768
    to_port    = 65535
  }

  egress {
    protocol        = "tcp"
    rule_no         = 120
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 80
    to_port         = 80
  }

  egress {
    protocol        = "tcp"
    rule_no         = 130
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 443
    to_port         = 443
  }

  tags = {
    Name = "Database_private_subnet_1d_ACL"
  }
}