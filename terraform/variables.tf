variable "region" {
  default = "us-east-1"
}

variable "dbusername" {
  type = string
}

variable "dbpassword" {
  type = string
}

variable "PXL_public_ips" {
  default = ["193.190.154.173/32", "193.190.154.174/32", "193.190.154.175/32", "193.190.154.176/32"]
}

variable "Jonas_public_ip" {
  default = "84.192.51.15/32"
}

variable "Jarne_public_ip" {
  default = "84.195.226.187/32"
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "public_ssh_key" {
  type = string
}

variable "private_ssh_key_file_path" {
  type = string
}

variable "private_ssh_key_file_path_on_bastion_host" {
  type = string
}

variable "assets_folder" {
  default = "..\\folder.txt"
}

variable "images_folder" {
  default = "..\\assets\\images\\"
}

variable "css_folder" {
  default = "..\\assets\\css\\"
}

variable "js_folder" {
  default = "..\\assets\\js\\"
}