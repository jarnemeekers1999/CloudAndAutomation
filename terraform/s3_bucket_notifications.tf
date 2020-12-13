resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.Webapp_s3_bucket.id


  lambda_function {
    lambda_function_arn = aws_lambda_function.write_image_name.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "assets/images/"
    filter_suffix       = ".jpg"
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}

