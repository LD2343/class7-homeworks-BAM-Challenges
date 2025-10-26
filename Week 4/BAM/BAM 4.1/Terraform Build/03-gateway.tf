# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/eip
# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/nat_gateway

# Internet Gateway
# Allows resources in public subnets to access the internet
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "demo-igw"
  }
}

# Elastic IP for NAT Gateway
# NAT gateway needs a static public IP address
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "demo-nat-eip"
  }

  depends_on = [aws_internet_gateway.main]
}

# NAT Gateway
# Allows resources in private subnets to reach the internet
# but prevents the internet from initiating connections to them
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "demo-nat-gateway"
  }

  depends_on = [aws_internet_gateway.main]
}

