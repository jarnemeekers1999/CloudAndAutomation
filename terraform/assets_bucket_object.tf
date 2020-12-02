resource "aws_s3_bucket_object" "assets_folder" {
  bucket = aws_s3_bucket.Webapp_s3_bucket.id
  acl    = "public-read"
  key    = "assets/"
  source = var.assets_folder # Empty text file to put in the s3 bucket to create a directory 
}

resource "aws_s3_bucket_object" "images_folder" {
  bucket = aws_s3_bucket.Webapp_s3_bucket.id
  acl    = "public-read"
  key    = "assets/images/"
  source = var.assets_folder # Empty text file to put in the s3 bucket to create a directory
}

resource "aws_s3_bucket_object" "images_folder_fjords" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/images/fjords.jpg"
  content_type = "image/jpeg"
  source       = "${var.images_folder}fjords.jpg"
}

resource "aws_s3_bucket_object" "images_folder_lights" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/images/lights.jpg"
  content_type = "image/jpeg"
  source       = "${var.images_folder}lights.jpg"
}

resource "aws_s3_bucket_object" "images_folder_nature" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/images/nature.jpg"
  content_type = "image/jpeg"
  source       = "${var.images_folder}nature.jpg"
}
