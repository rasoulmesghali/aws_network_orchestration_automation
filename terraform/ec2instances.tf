resource "aws_instance" "vm1_site_1a" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.site_1a.id
  private_ip             = "10.0.11.100"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "vm1_site_1a"
  }
}

resource "aws_instance" "vm1_site_2a" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.site_2a.id
  private_ip             = "10.0.12.100"
#   associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "vm1_site_2a"
  }
}

resource "aws_instance" "vm1_site_1b" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.site_1b.id
  private_ip             = "10.0.21.100"
#   associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "vm1_site_1b"
  }
}

resource "aws_instance" "vm1_site_2b" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.site_2b.id
  private_ip             = "10.0.22.100"
#   associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name = "key1"
  tags = {
    "Name" = "vm1_site_2b"
  }
}