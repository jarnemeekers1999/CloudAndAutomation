data "archive_file" "image_name" {
  type        = "zip"
  source_file = "../write_image_name.py"
  output_path = "../write_image_name.zip"
}

resource "aws_lambda_function" "write_image_name" {
  filename      = "../write_image_name.zip"
  function_name = "write_image_name"
  role          = data.aws_iam_role.lambda_role.arn
  handler       = "write_image_name.write_handler"
  runtime       = "python3.7"

  file_system_config {
    # EFS file system access point ARN
    arn = aws_efs_access_point.webservers_efs_access_point.arn

    # Local mount path inside the lambda function. Must start with '/mnt/'.
    local_mount_path = "/mnt/efs"
  }

  vpc_config {
    # Every subnet should be able to reach an EFS mount target in the same Availability Zone. Cross-AZ mounts are not permitted.
    subnet_ids         = [aws_subnet.Webserver_private_subnet_1b.id, aws_subnet.Webserver_private_subnet_1c.id]
    security_group_ids = [aws_security_group.Webservers_security_group.id]
  }

  # Explicitly declare dependency on EFS mount target.
  # When creating or updating Lambda functions, mount target must be in 'available' lifecycle state.
  depends_on = [aws_efs_mount_target.efs_mount_target_1b, data.archive_file.image_name]
}