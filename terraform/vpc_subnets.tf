resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "central_edge_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "central_edge_a"
  }
}

resource "aws_subnet" "central_edge_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "central_edge_b"
  }
}

resource "aws_subnet" "site_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "site_1a"
  }
}

resource "aws_subnet" "site_2a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "site_2a"
  }
}


resource "aws_subnet" "site_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.21.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "site_1b"
  }
}

resource "aws_subnet" "site_2b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.22.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "site_2b"
  }
}
