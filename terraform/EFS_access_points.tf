resource "aws_efs_access_point" "webservers_efs_access_point" {
  file_system_id = aws_efs_file_system.webservers_efs.id

  root_directory {
    path = "/"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "777"
    }
  }
}