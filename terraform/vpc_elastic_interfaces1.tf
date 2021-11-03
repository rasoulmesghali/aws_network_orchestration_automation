resource "aws_network_interface" "cr_1" {
  subnet_id       = aws_subnet.central_edge_a.id
  private_ips     = ["10.0.1.10"]
  security_groups = [aws_security_group.allow_all.id]
  description     = "cr_1"
  source_dest_check = false
  attachment {
    instance     = aws_instance.centralRouter.id
    device_index = 2
  }
  tags = {
    "Name" = "cr_1"
  }
}

resource "aws_network_interface" "era_1" {
  subnet_id       = aws_subnet.site_1a.id
  private_ips     = ["10.0.11.10"]
  security_groups = [aws_security_group.allow_all.id]
  description     = "era_1"
  source_dest_check = false
  attachment {
    instance     = aws_instance.edgeRouterA.id
    device_index = 2
  }
  tags = {
    "Name" = "era_1"
  }
}

resource "aws_network_interface" "erb_1" {
  subnet_id       = aws_subnet.site_1b.id
  private_ips     = ["10.0.21.10"]
  security_groups = [aws_security_group.allow_all.id]
  description     = "erb_1"
  source_dest_check = false
  attachment {
    instance     = aws_instance.edgeRouterB.id
    device_index = 2
  }
  tags = {
    "Name" = "erb_1"
  }
}
