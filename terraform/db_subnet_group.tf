resource "aws_db_subnet_group" "Database_private_subnet_1_subnet_group" {
  name        = "database-private-subnet-1-subnet-group"
  subnet_ids  = [aws_subnet.Database_private_subnet_1d.id, aws_subnet.Database_private_subnet_1e.id]
  description = "Database_private_subnet_1_subnet_group for RDS"

  tags = {
    Name = "Database_private_subnet_1_subnet_group"
  }
}