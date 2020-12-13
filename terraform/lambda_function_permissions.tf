resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.write_image_name.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.Webapp_s3_bucket.arn
}
