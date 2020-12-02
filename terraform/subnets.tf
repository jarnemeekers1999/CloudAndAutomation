resource "aws_subnet" "Bastion_host_public_subnet" {
  vpc_id                  = aws_vpc.Webapp_vpc.id
  cidr_block              = "172.31.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "Bastion host public subnet"
  }
}

resource "aws_subnet" "Loadbalancer_public_subnet_1b" {
  vpc_id                  = aws_vpc.Webapp_vpc.id
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    Name = "Loadbalancer public subnet"
  }
}

resource "aws_subnet" "Loadbalancer_public_subnet_1c" {
  vpc_id                  = aws_vpc.Webapp_vpc.id
  cidr_block              = "172.31.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"
  tags = {
    Name = "Loadbalancer public subnet"
  }
}

resource "aws_subnet" "Webserver_private_subnet_1b" {
  vpc_id                          = aws_vpc.Webapp_vpc.id
  cidr_block                      = "172.31.3.0/24"
  availability_zone               = "us-east-1b"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.Webapp_vpc.ipv6_cidr_block, 8, 1)

  tags = {
    Name = "Webserver private subnet 1b"
  }
}

resource "aws_subnet" "Webserver_private_subnet_1c" {
  vpc_id                          = aws_vpc.Webapp_vpc.id
  cidr_block                      = "172.31.4.0/24"
  availability_zone               = "us-east-1c"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.Webapp_vpc.ipv6_cidr_block, 8, 2)

  tags = {
    Name = "Webserver private subnet 1c"
  }
}

resource "aws_subnet" "Database_private_subnet_1d" {
  vpc_id                          = aws_vpc.Webapp_vpc.id
  cidr_block                      = "172.31.5.0/24"
  availability_zone               = "us-east-1d"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.Webapp_vpc.ipv6_cidr_block, 8, 3)

  tags = {
    Name = "Database_private_subnet 1d"
  }
}

resource "aws_subnet" "Database_private_subnet_1e" {
  vpc_id                          = aws_vpc.Webapp_vpc.id
  cidr_block                      = "172.31.6.0/24"
  availability_zone               = "us-east-1e"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.Webapp_vpc.ipv6_cidr_block, 8, 4)

  tags = {
    Name = "Database private subnet 1e"
  }
}

