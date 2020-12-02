# Routetable for the Bastion_host_public_subnet
resource "aws_route_table" "Bastion_host_public_subnet_routetable" {
  vpc_id = aws_vpc.Webapp_vpc.id

  # Routes to Webserver subnets

  # Route to igw
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Bastion_host_public_subnet_routetable"
  }
}

# Routetable for Loadbalancer_public_subnet_1b and Loadbalancer_public_subnet_1c
resource "aws_route_table" "Loadbalancer_public_subnet_1_routetable" {
  vpc_id = aws_vpc.Webapp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Loadbalancer_public_subnet_1_routetable"
  }
}

# Routetable for Webserver_private_subnet_1b and Webserver_private_subnet_1c
resource "aws_route_table" "Webserver_private_subnet_1_routetable" {
  vpc_id = aws_vpc.Webapp_vpc.id

  # Route to egw
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egw.id
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Webserver_private_subnet_1_routetable"
  }
}

# Routetable for Database_private_subnet_1d
resource "aws_route_table" "Database_private_subnet_1d_routetable" {
  vpc_id = aws_vpc.Webapp_vpc.id

  # Route to egw
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egw.id
  }

  tags = {
    Name = "Database_private_subnet_1d_routetable"
  }
}
