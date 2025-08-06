resource "aws_instance" "nginx" {
  ami           = "<AMI-ID>"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_nginx.id
  key_name      = "<key-pair>"
  security_groups = [aws_security_group.nginx_sg.name]
  tags = { Name = "Nginx-Server-Public" }
}

resource "aws_instance" "tomcat" {
  ami           = "<AMI-ID>"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_tomcat.id
  key_name      = "<key-pair>"
  security_groups = [aws_security_group.tomcat_sg.name]
  tags = { Name = "Tomcat-Server-Private" }
}
