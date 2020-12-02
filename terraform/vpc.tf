# Create a vpc for all resources
resource "aws_vpc" "Webapp_vpc" {
  cidr_block                       = "172.31.0.0/16"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "Webapp_vpc"
  }
}