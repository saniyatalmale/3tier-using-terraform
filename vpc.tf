resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  tags = { Name = "VPC-3-tier" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "IGW-3-tier" }
}

# Define subnets: public (nginx), private (tomcat/db)
resource "aws_subnet" "public_nginx" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = { Name = "Public-Subnet-Nginx" }
}

resource "aws_subnet" "private_tomcat" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-south-1a"
  tags = { Name = "Private-Subnet-Tomcat" }
}

resource "aws_subnet" "private_db" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "ap-south-1a"
  tags = { Name = "Private-Subnet-DB" }
}
