resource "aws_efs_mount_target" "efs_mount_target_1b" {
  file_system_id  = aws_efs_file_system.webservers_efs.id
  subnet_id       = aws_subnet.Webserver_private_subnet_1b.id
  security_groups = [aws_security_group.efs_mount_target_security_group.id]
}

resource "aws_efs_mount_target" "efs_mount_target_1c" {
  file_system_id  = aws_efs_file_system.webservers_efs.id
  subnet_id       = aws_subnet.Webserver_private_subnet_1c.id
  security_groups = [aws_security_group.efs_mount_target_security_group.id]
}

