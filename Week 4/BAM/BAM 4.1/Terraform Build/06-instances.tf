# https://registry.terraform.io/providers/hashicorp/aws/6.17.0/docs/resources/instance

# Windows Server
resource "aws_instance" "windows-bastion-server" {
  ami = "ami-0f9c6511313201a5b"
  instance_type = "t3.large"
  key_name = "windows-kp"
  vpc_security_group_ids = [aws_security_group.windows-sg.id]
  subnet_id = aws_subnet.public_1.id
  associate_public_ip_address = true

  tags = {
    Name = "windows-bastion-server"
  }
}

# Linux Servers
# Linux Server 1
resource "aws_instance" "linux-server1" {
  ami = "ami-07860a2d7eb515d9a"
  instance_type = "t3.micro"
  key_name = "linux-kp"
  vpc_security_group_ids = [aws_security_group.linux-sg.id]
  subnet_id = aws_subnet.private_1.id

  user_data = file("linux-script1.sh")

  tags = {
    Name = "linux-server1"
  }
}  

# Linux Server 2
resource "aws_instance" "linux-server2" {
  ami = "ami-07860a2d7eb515d9a"
  instance_type = "t3.micro"
  key_name = "linux-kp"
  vpc_security_group_ids = [aws_security_group.linux-sg.id]
  subnet_id = aws_subnet.private_2.id

  user_data = file("linux-script2.sh")

  tags = {
    Name = "linux-server2"
  }
}

# Linux Server 3
resource "aws_instance" "linux-server3" {
  ami = "ami-07860a2d7eb515d9a"
  instance_type = "t3.micro"
  key_name = "linux-kp"
  vpc_security_group_ids = [aws_security_group.linux-sg.id]
  subnet_id = aws_subnet.private_3.id

  user_data = file("linux-script3.sh")

  tags = {
    Name = "linux-server3"
  }
}
