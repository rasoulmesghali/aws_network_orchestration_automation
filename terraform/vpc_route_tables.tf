# route tables

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "central_edge_a" {
  vpc_id = aws_vpc.main.id

  tags = {
  Name = "central_edge_a"
  }
}

resource "aws_route_table" "central_edge_b" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "central_edge_b"
  }
}


resource "aws_route_table" "site_1b" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      network_interface_id = "${aws_network_interface.erb_1.id}"
    }
  route {
      cidr_block = "10.0.12.0/24"
      network_interface_id = "${aws_network_interface.erb_1.id}"
    }
  route {
      cidr_block = "10.0.11.0/24"
      network_interface_id = "${aws_network_interface.erb_1.id}"
    }
    route {
      cidr_block = "10.0.22.0/24"
      network_interface_id = "${aws_network_interface.erb_1.id}"
    }
  tags = {
    Name = "site_1b"
  }
}

# resource "aws_route_table" "site_2b" {
#   vpc_id = aws_vpc.main.id
#   route {
#       cidr_block = "0.0.0.0/0"
#       network_interface_id = "${aws_network_interface.erb_2.id}"
#     }
#   route {
#       cidr_block = "10.0.12.0/24"
#       network_interface_id = "${aws_network_interface.erb_2.id}"
#     }
#   route {
#       cidr_block = "10.0.21.0/24"
#       network_interface_id = "${aws_network_interface.erb_2.id}"
#     }
#     route {
#       cidr_block = "10.0.11.0/24"
#       network_interface_id = "${aws_network_interface.erb_2.id}"
#     }
#   tags = {
#     Name = "site_2b"
#   }
# }

resource "aws_route_table" "site_1a" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      network_interface_id = "${aws_network_interface.era_1.id}"
    }
  route {
      cidr_block = "10.0.12.0/24"
      network_interface_id = "${aws_network_interface.era_1.id}"
    }
  route {
      cidr_block = "10.0.21.0/24"
      network_interface_id = "${aws_network_interface.era_1.id}"
    }
    route {
      cidr_block = "10.0.22.0/24"
      network_interface_id = "${aws_network_interface.era_1.id}"
    }
  tags = {
    Name = "site_1a"
  }
}

# resource "aws_route_table" "site_2a" {
#   vpc_id = aws_vpc.main.id
#   route {
#       cidr_block = "0.0.0.0/0"
#       network_interface_id = "${aws_network_interface.era_2.id}"
#     }
#   route {
#       cidr_block = "10.0.11.0/24"
#       network_interface_id = "${aws_network_interface.era_2.id}"
#     }
#   route {
#       cidr_block = "10.0.21.0/24"
#       network_interface_id = "${aws_network_interface.era_2.id}"
#     }
#   route {
#       cidr_block = "10.0.22.0/24"
#       network_interface_id = "${aws_network_interface.era_2.id}"
#     }
#   tags = {
#     Name = "site_2a"
#   }
# }

# route table associations
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}
resource "aws_route_table_association" "central_edge_a" {
  subnet_id      = aws_subnet.central_edge_a.id
  route_table_id = aws_route_table.central_edge_a.id
}

resource "aws_route_table_association" "central_edge_b" {
  subnet_id      = aws_subnet.central_edge_b.id
  route_table_id = aws_route_table.central_edge_b.id
}

# resource "aws_route_table_association" "site_2b" {
#   subnet_id      = aws_subnet.site_2b.id
#   route_table_id = aws_route_table.site_2b.id
# }

# resource "aws_route_table_association" "site_2a" {
#   subnet_id      = aws_subnet.site_2a.id
#   route_table_id = aws_route_table.site_2a.id
# }

resource "aws_route_table_association" "site_1b" {
  subnet_id      = aws_subnet.site_1b.id
  route_table_id = aws_route_table.site_1b.id
}

resource "aws_route_table_association" "site_1a" {
  subnet_id      = aws_subnet.site_1a.id
  route_table_id = aws_route_table.site_1a.id
}

resource "aws_route" "default_route_for_main" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "default_route_for_central_edge_a" {
  route_table_id         = aws_route_table.central_edge_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "default_route_for_central_edge_b" {
  route_table_id         = aws_route_table.central_edge_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


