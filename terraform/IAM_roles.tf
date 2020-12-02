#TODO create IAM roles

/*resource "aws_iam_role" "RDS_role" {
  name = "RDS_role"

  assume_role_policy = <<EOF
{
  "Version": "2020-10-20",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "rds.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "RDS_role"
  }
}
*/