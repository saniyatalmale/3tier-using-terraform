output "nginx_public_ip" {
  value = aws_instance.nginx.public_ip
}

output "tomcat_private_ip" {
  value = aws_instance.tomcat.private_ip
}

output "rds_endpoint" {
  value = aws_db_instance.rds_mysql.endpoint
}
