resource "aws_instance" "centralRouter" {
  ami = "ami-04f12a282ebcfb9cc"
  instance_type = "t3.medium"
  subnet_id = aws_subnet.main.id
  private_ip = "10.0.10.10"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "centralRouter"
  }
}

resource "aws_instance" "edgeRouterA" {
  ami = "ami-04f12a282ebcfb9cc"
  instance_type = "t3.medium"
  subnet_id = aws_subnet.central_edge_a.id
  private_ip = "10.0.1.11"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "edgeRouterA"
  }
}

resource "aws_instance" "edgeRouterB" {
  ami = "ami-04f12a282ebcfb9cc"
  instance_type = "t3.medium"
  subnet_id = aws_subnet.central_edge_b.id
  private_ip = "10.0.2.11"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "edgeRouterB"
  }
}
