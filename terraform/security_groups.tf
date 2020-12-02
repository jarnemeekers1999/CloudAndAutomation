# Security group for the bastion host
resource "aws_security_group" "Bastion_host_security_group" {
  name        = "Bastion_host_security_group"
  description = "Allow inbound and outbound SSH traffic"
  vpc_id      = aws_vpc.Webapp_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH access from PXL to Bastion host"
    cidr_blocks = var.PXL_public_ips
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH access Jarne and Jonas to Bastion host"
    cidr_blocks = [var.Jonas_public_ip, var.Jarne_public_ip]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH access to everywhere"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "bastion_host can HTTP to internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "bastion_host can HTTPS to internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion_host_security_group"
  }
}

# Security group for the webservers
resource "aws_security_group" "Webservers_security_group" {
  name        = "Webservers_security_group"
  description = "Allow inbound and outbound SSH from and to Bastion host, HTTP and HTTPS traffic from loadbalancer"
  vpc_id      = aws_vpc.Webapp_vpc.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    description     = "SSH access from Bastion host to webservers"
    security_groups = [aws_security_group.Bastion_host_security_group.id]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    description     = "Loadbalancer HTTP access to webservers"
    security_groups = [aws_security_group.Loadbalancer_security_group.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    description     = "Loadbalancer HTTPS access to webservers"
    security_groups = [aws_security_group.Loadbalancer_security_group.id]
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    description     = "HTTP access from webservers to Loadbalancer"
    security_groups = [aws_security_group.Loadbalancer_security_group.id]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    description      = "HTTP access from webservers to Loadbalancer"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP access from webservers to Loadbalancer"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    description     = "HTTPS access from webservers to Loadbalancer"
    security_groups = [aws_security_group.Loadbalancer_security_group.id]
  }

  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    description      = "HTTP access from webservers to Loadbalancer"
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "HTTP access from webservers to Loadbalancer"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    description = "Webservers can connect to RDS"
    cidr_blocks = ["172.31.5.0/24", "172.31.6.0/24"]
  }

  tags = {
    Name = "Webservers_security_group"
  }
}

#Security group for the RDS
resource "aws_security_group" "RDS_security_group" {
  name        = "RDS_security_group"
  description = "Allow inbound and outbound SSH from and to Bastion host, HTTP and HTTPS traffic from loadbalancer"
  vpc_id      = aws_vpc.Webapp_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    description     = "Webservers access to MySQL"
    security_groups = [aws_security_group.Webservers_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access to everywhere"
  }

  tags = {
    Name = "RDS_security_group"
  }
}

#Load balancer security group
resource "aws_security_group" "Loadbalancer_security_group" {
  name        = "Loadbalancer_security_group"
  description = "Allow inbound and outbound SSH from and to Bastion host, HTTP and HTTPS traffic from loadbalancer"
  vpc_id      = aws_vpc.Webapp_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "PXL HTTP access to Loadbalancer"
    cidr_blocks = var.PXL_public_ips
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "Jarne and Jonas HTTP access to Loadbalancer"
    cidr_blocks = [var.Jonas_public_ip, var.Jarne_public_ip]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "PXL HTTPS access to Loadbalancer"
    cidr_blocks = var.PXL_public_ips
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Jarne and Jonas HTTPS access to Loadbalancer"
    cidr_blocks = [var.Jonas_public_ip, var.Jarne_public_ip]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Loadbalancer HTTP access to everywhere"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Loadbalancer HTTPS access to everywhere"
  }
  tags = {
    Name = "Loadbalancer_security_group"
  }
}
