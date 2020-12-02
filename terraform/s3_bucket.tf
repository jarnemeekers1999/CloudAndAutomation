resource "aws_s3_bucket" "Webapp_s3_bucket" {
  bucket = "cloud-and-automation-webapp"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "cloud-and-automation-webapp"
  }

}

