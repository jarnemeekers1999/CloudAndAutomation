resource "aws_key_pair" "ssh_keypair" {
  key_name   = "ssh_Jonas"
  public_key = file(var.public_ssh_key)
}
