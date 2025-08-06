# resource "aws_db_subnet_group" "db_subnet_group" {
#   name       = "db-subnet-group"
#   subnet_ids = [aws_subnet.private_db.id]
#   tags = { Name = "RDS Subnet Group" }
# }

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [
    aws_subnet.private_tomcat.id,
    aws_subnet.private_db.id
  ]

  tags = {
    Name = "RDS Subnet Group"
  }
}


resource "aws_db_instance" "rds_mysql" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7.44"                # ✅ stable version
  instance_class         = "db.t3.micro"           # ✅ recommended over t2.micro
  username               = "admin"
  password               = "Passwd123$"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
  tags = {
    Name = "Student-DB"
  }
}
