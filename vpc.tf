resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = "VPC-3-tier" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "IGW-3-tier" }
}

resource "aws_subnet" "public_nginx" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_nginx
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true
  tags = { Name = "Public NGINX Subnet" }
}

resource "aws_subnet" "private_tomcat" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_tomcat
  availability_zone = "ap-southeast-1b"
  tags = { Name = "Private Tomcat Subnet" }
}

resource "aws_subnet" "private_db" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_db
  availability_zone = "ap-southeast-1c"
  tags = { Name = "Private DB Subnet" }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "RT-Public-Subnet" }
}

resource "aws_route_table_association" "assoc_public" {
  subnet_id      = aws_subnet.public_nginx.id
  route_table_id = aws_route_table.public_rt.id
}
