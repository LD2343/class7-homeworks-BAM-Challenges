# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/subnet

# Public Subnets
# These subnets have direct internet access via the internet gateway

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.130.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-public-subnet-1"
    Type = "Public"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.130.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-public-subnet-2"
    Type = "Public"
  }
}

resource "aws_subnet" "public_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.130.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-public-subnet-3"
    Type = "Public"
  }
}

# Private Subnets
# These subnets do not have direct internet access
# They can reach the internet through the NAT gateway

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.130.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "demo-private-subnet-1"
    Type = "Private"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.130.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "demo-private-subnet-2"
    Type = "Private"
  }
}

resource "aws_subnet" "private_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.130.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "demo-private-subnet-3"
    Type = "Private"
  }
}