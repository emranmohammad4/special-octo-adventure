#create ec2 instance
resource "aws_instance" "slm-web-server" {
  ami                    = "ami-05b457b541faec0ca"
  instance_type          = "t2.micro"
  key_name               = "lms.key"
  subnet_id              = aws_subnet.sml-subnet.id
  vpc_security_group_ids = [aws_security_group.sml-sg.id]
  user_data              = file("web.sh")
  tags = {
    Name = "slm web server"
  }
}
