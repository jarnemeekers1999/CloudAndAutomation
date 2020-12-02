data "aws_ami" "ubuntu_ami" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0dba2cb6798deb6d8"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20200907"]
  }
}