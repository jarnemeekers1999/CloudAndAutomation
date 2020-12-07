resource "aws_efs_access_point" "webservers_efs_access_point" {
  file_system_id = aws_efs_file_system.webservers_efs.id
}