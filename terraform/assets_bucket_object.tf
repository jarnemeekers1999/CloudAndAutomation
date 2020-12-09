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

resource "aws_s3_bucket_object" "css_folder" {
  bucket = aws_s3_bucket.Webapp_s3_bucket.id
  acl    = "public-read"
  key    = "assets/css/"
  source = var.assets_folder # Empty text file to put in the s3 bucket to create a directory
}

resource "aws_s3_bucket_object" "js_folder" {
  bucket = aws_s3_bucket.Webapp_s3_bucket.id
  acl    = "public-read"
  key    = "assets/js/"
  source = var.assets_folder # Empty text file to put in the s3 bucket to create a directory
}

resource "aws_s3_bucket_object" "css_folder_bootstrap_min_css" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/css/bootstrap.min.css"
  content_type = "text/css"
  source       = "${var.css_folder}bootstrap.min.css"
}

resource "aws_s3_bucket_object" "css_folder_bootstrap_min_css_map" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/css/bootstrap.min.css.map"
  content_type = "application/json"
  source       = "${var.css_folder}bootstrap.min.css.map"
}

resource "aws_s3_bucket_object" "css_folder_style_css" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/css/style.css"
  content_type = "text/css"
  source       = "${var.css_folder}style.css"
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

resource "aws_s3_bucket_object" "css_folder_bootstrap_bundle_min_js_map" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/js/bootstrap.bundle.min.js.map"
  content_type = "application/json"
  source       = "${var.js_folder}bootstrap.bundle.min.js.map"
}

resource "aws_s3_bucket_object" "css_folder_bootstrap_min_js" {
  bucket       = aws_s3_bucket.Webapp_s3_bucket.id
  acl          = "public-read"
  key          = "assets/js/bootstrap.min.js"
  content_type = "text/javascript"
  source       = "${var.js_folder}bootstrap.min.js"
}