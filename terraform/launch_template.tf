data "aws_ami" "webserver_ami" {
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["Webserver_ami"]
  }
  depends_on = [aws_instance.bastion_host]
}

resource "aws_launch_template" "webservers_launch_template" {
  name        = "webserver"
  description = "The launch template for webservers in the auto-scaling group"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  image_id                             = data.aws_ami.webserver_ami.id
  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_keypair.key_name

  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = [aws_security_group.Webservers_security_group.id]

  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "webserver"
    }
  }
}

