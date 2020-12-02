# Routetable association with Bastion_host_public_subnet
resource "aws_route_table_association" "Bastion_host_public_subnet_routetable_association" {
  subnet_id      = aws_subnet.Bastion_host_public_subnet.id
  route_table_id = aws_route_table.Bastion_host_public_subnet_routetable.id
}

# Routetable association with Loadbalancer_public_subnet_1b
resource "aws_route_table_association" "Loadbalancer_public_subnet_1b_routetable_association" {
  subnet_id      = aws_subnet.Loadbalancer_public_subnet_1b.id
  route_table_id = aws_route_table.Loadbalancer_public_subnet_1_routetable.id
}

# Routetable association with Loadbalancer_public_subnet_1c
resource "aws_route_table_association" "Loadbalancer_public_subnet_1c_routetable_association" {
  subnet_id      = aws_subnet.Loadbalancer_public_subnet_1c.id
  route_table_id = aws_route_table.Loadbalancer_public_subnet_1_routetable.id
}

# Routetable association with Webserver_private_subnet_1b
resource "aws_route_table_association" "Webserver_private_subnet_1b_routetable_association" {
  subnet_id      = aws_subnet.Webserver_private_subnet_1b.id
  route_table_id = aws_route_table.Webserver_private_subnet_1_routetable.id
}

# Routetable association with Webserver_private_subnet_1c
resource "aws_route_table_association" "Webserver_private_subnet_1c_routetable_association" {
  subnet_id      = aws_subnet.Webserver_private_subnet_1c.id
  route_table_id = aws_route_table.Webserver_private_subnet_1_routetable.id
}

# Routetable association with Database_private_subnet_1d
resource "aws_route_table_association" "Database_private_subnet_1d_routetable_association" {
  subnet_id      = aws_subnet.Database_private_subnet_1d.id
  route_table_id = aws_route_table.Database_private_subnet_1d_routetable.id
}