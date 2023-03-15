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

# internet gateway
resource "aws_internet_gateway" "sml-igw" {
  vpc_id = aws_vpc.sml.id

  tags = {
    Name = "sml-igw"
  }
}

# route table

resource "aws_route_table" "sml-rt" {
  vpc_id = aws_vpc.sml.id
  tags = {
    Name = "sml-rt"
  }
}