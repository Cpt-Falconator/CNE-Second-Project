resource "aws_vpc" "project_VPC" {
  cidr_block = "13.37.0.0/16"
  tags = {
    "Project" : "Second"
  }
}

resource "aws_internet_gateway" "project_GW" {
  vpc_id = aws_vpc.project_VPC.id

  tags = {
    "Name" : "Project IG"
    "Project" : "Second"
  }
}

resource "aws_subnet" "Pub_Sub" {
  vpc_id                  = aws_vpc.project_VPC.id
  availability_zone       = "eu-west-1b"
  cidr_block              = "13.37.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Project" : "Second"
  }
}

resource "aws_subnet" "Pri_Sub" {
  vpc_id                  = aws_vpc.project_VPC.id
  availability_zone       = "eu-west-1a"
  cidr_block              = "13.37.2.0/24"
  tags = {
    "Project" : "Second"
  }
}

resource "aws_db_subnet_group" "DB_Subnet" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.Pri_Sub.id, aws_subnet.Pub_Sub.id]

  tags = {
    "Name" : "Project_DB_Subnet"
    "Project" : "Second"
  }
}

resource "aws_security_group" "Project_Jenkins_SG" {
  name        = "Project-Jenkins-SG"
  description = "Allow ssh"
  vpc_id      = aws_vpc.project_VPC.id

  ingress {
    description = "ssh to VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" : "Project_Jenkins_SG"
    "Project" : "Second"
  }
}

resource "aws_route_table" "project_RT" {
  vpc_id = aws_vpc.project_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_GW.id
  }

  tags = {
    "Name" : "Project_Route_Table"
    "Project" : "Second"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Pub_Sub.id
  route_table_id = aws_route_table.project_RT.id
}