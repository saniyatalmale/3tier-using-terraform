resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  name                 = "studentapp"
  username             = "admin"
  password             = "Passwd123$"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.mysql_subnet.name
}

resource "aws_db_subnet_group" "mysql_subnet" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private_db.id]
  tags = { Name = "MySQL Subnet Group" }
}
