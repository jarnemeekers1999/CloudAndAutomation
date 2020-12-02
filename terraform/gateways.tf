# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Webapp_vpc.id

  tags = {
    Name = "igw"
  }
}

# Egress only internet gateway

resource "aws_egress_only_internet_gateway" "egw" {
  vpc_id = aws_vpc.Webapp_vpc.id

  tags = {
    Name = "egw"
  }
}