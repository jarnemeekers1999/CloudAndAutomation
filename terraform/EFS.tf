resource "aws_efs_file_system" "webservers_efs" {
  creation_token = "assets_filesystem"

  tags = {
    Name = "assets_filesystem"
  }
}