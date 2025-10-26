# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/security_group

# Security Group for Windows Server
resource "aws_security_group" "windows-sg" {
  name        = "windows-sg"
  description = "windows-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "windows-sg"
  }

}

#Security Group for Linux Servers
resource "aws_security_group" "linux-sg" {
  name        = "linux-sg"
  description = "linux-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.windows-sg.id]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.windows-sg.id]
  }

  ingress {
    description = "ICMP"
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    security_groups = [aws_security_group.windows-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "linux-sg"
  }

}