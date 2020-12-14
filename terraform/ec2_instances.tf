resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ssh_keypair.key_name
  disable_api_termination     = false
  subnet_id                   = aws_subnet.Bastion_host_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Bastion_host_security_group.id]

  root_block_device {
    volume_size = 20
  }

  provisioner "remote-exec" {
    inline = ["mkdir ~/.aws"]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    source      = "..\\webapp_playbook.yaml"
    destination = "~/webapp_playbook.yaml"

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    source      = pathexpand("~\\.aws\\config")
    destination = "~/.aws/config"

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    source      = pathexpand("~\\.aws\\credentials")
    destination = "~/.aws/credentials"

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    content     = <<EOF
dbserver: ${aws_db_instance.Webapp_db.address}
dbusername: ${var.dbusername}
dbpassword: ${var.dbpassword}
dbname: ${aws_db_instance.Webapp_db.name}
efs_access_point_id: ${aws_efs_access_point.webservers_efs_access_point.id}
efs_id: ${aws_efs_file_system.webservers_efs.id}
bucket_url: https://${aws_s3_bucket.Webapp_s3_bucket.bucket_domain_name}
EOF
    destination = "~/tf_vars.yml"

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    source      = "..\\webapp_ami.json"
    destination = "~/webapp_ami.json"

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    content     = <<EOF
  {
    "source_ami": "${data.aws_ami.ubuntu_ami.id}",
    "subnet_id": "${aws_subnet.Webserver_private_subnet_1b.id}",
    "security_group_ids": "${aws_security_group.Webservers_security_group.id}",
    "vpc_id": "${aws_vpc.Webapp_vpc.id}",
    "keypair_name": "${aws_key_pair.ssh_keypair.key_name}",
    "ssh_user": "${var.ssh_user}",
    "private_key_file": "${var.private_ssh_key_file_path_on_bastion_host}",
    "ansible_playbook_file_path": "/home/ubuntu/webapp_playbook.yaml",
    "inventory_file": "~/inventory.yaml"
  }
EOF
    destination = "~/webapp_ami_variables.json"

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  provisioner "file" {
    source      = pathexpand(var.private_ssh_key_file_path)
    destination = var.private_ssh_key_file_path_on_bastion_host

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  # Install Ansible on bastion_host
  provisioner "remote-exec" {
    inline = ["sleep 210",
      "sudo apt -y update",
      "sudo apt -y install ansible",
      "sudo chmod 600 ${var.private_ssh_key_file_path_on_bastion_host}",
      "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -",
      "sudo apt-add-repository \"deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main\"",
      "sudo apt install packer",
      "packer build -var-file='/home/ubuntu/webapp_ami_variables.json' '/home/ubuntu/webapp_ami.json'"
    ]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_ssh_key_file_path)
    }
  }

  tags = {
    Name = "Bastion_host"
  }
}

output "bastion_host_public_ip" {
  value = aws_instance.bastion_host.public_ip
}