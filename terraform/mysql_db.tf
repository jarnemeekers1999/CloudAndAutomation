resource "aws_db_instance" "Webapp_db" {
  allocated_storage           = 20
  allow_major_version_upgrade = true
  db_subnet_group_name        = aws_db_subnet_group.Database_private_subnet_1_subnet_group.name
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t2.micro"
  name                        = "WebappDB"
  username                    = var.dbusername
  password                    = var.dbpassword
  skip_final_snapshot         = true
  identifier                  = "webappdb"
  multi_az                    = true
  parameter_group_name        = "default.mysql8.0"
  option_group_name           = "default:mysql-8-0"
  vpc_security_group_ids      = [aws_security_group.RDS_security_group.id]

  tags = {
    Name = "Webapp_db"
  }
}