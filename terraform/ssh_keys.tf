resource "aws_key_pair" "ssh_Jonas" {
  key_name   = "ssh_Jonas"
  public_key = var.Jonas_public_ssh_key
}

resource "aws_key_pair" "ssh_Jarne" {
  key_name   = "ssh_Jarne"
  public_key = var.Jarne_public_ssh_key
}