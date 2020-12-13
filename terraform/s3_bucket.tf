resource "aws_s3_bucket" "Webapp_s3_bucket" {
  bucket        = "cloud-and-automation-webapp"
  acl           = "public-read"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = {
    Name = "cloud-and-automation-webapp"
  }

}

resource "aws_s3_bucket_public_access_block" "allow_s3_public_access" {
  bucket = aws_s3_bucket.Webapp_s3_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

