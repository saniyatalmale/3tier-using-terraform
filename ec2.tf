resource "aws_instance" "nginx" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_nginx.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true
  tags = { Name = "Nginx-Server" }
}

resource "aws_instance" "tomcat" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_tomcat.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.tomcat_sg.id]
  tags = { Name = "Tomcat-Server" }
}
