# resource "aws_instance" "linux-server1" {
#   ami = "ami-07860a2d7eb515d9a"
#   instance_type = "t3.micro"
#   key_name = "linux-kp"
#   vpc_security_group_ids = [aws_security_group.linux-sg.id]
#   subnet_id = aws_subnet.private_1.id

#   user_data = file("linux-script1.sh")

#   tags = {
#     Name = "linux-server1"
#   }
# }