# vpc cerations for lms
resource "aws_vpc" "sml" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sml"
  }
}

# subnet
resource "aws_subnet" "sml-subnet" {
  vpc_id                  = aws_vpc.sml.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "sml-subnet"
  }
}