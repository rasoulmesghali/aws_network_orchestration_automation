
 resource "aws_route_table" "site_2a" {
    provisioner "local-exec" {
        command = "sleep 10"
    }
   vpc_id = aws_vpc.main.id
   route {
       cidr_block = "0.0.0.0/0"
       network_interface_id = "${aws_network_interface.era_2.id}"
     }
   route {
       cidr_block = "10.0.11.0/24"
       network_interface_id = "${aws_network_interface.era_2.id}"
     }
   route {
       cidr_block = "10.0.21.0/24"
       network_interface_id = "${aws_network_interface.era_2.id}"
     }
   route {
       cidr_block = "10.0.22.0/24"
       network_interface_id = "${aws_network_interface.era_2.id}"
     }
   tags = {
     Name = "site_2a"
   }
 }


 resource "aws_route_table" "site_2b" {
    provisioner "local-exec" {
        command = "sleep 10"
    }
   vpc_id = aws_vpc.main.id
   route {
       cidr_block = "0.0.0.0/0"
       network_interface_id = "${aws_network_interface.erb_2.id}"
     }
   route {
       cidr_block = "10.0.12.0/24"
       network_interface_id = "${aws_network_interface.erb_2.id}"
     }
   route {
       cidr_block = "10.0.21.0/24"
       network_interface_id = "${aws_network_interface.erb_2.id}"
     }
     route {
       cidr_block = "10.0.11.0/24"
       network_interface_id = "${aws_network_interface.erb_2.id}"
     }
   tags = {
     Name = "site_2b"
   }
 }


 resource "aws_route_table_association" "site_2b" {
    provisioner "local-exec" {
        command = "sleep 10"
    }
   subnet_id      = aws_subnet.site_2b.id
   route_table_id = aws_route_table.site_2b.id
 }

 resource "aws_route_table_association" "site_2a" {
    provisioner "local-exec" {
        command = "sleep 10"
    }
   subnet_id      = aws_subnet.site_2a.id
   route_table_id = aws_route_table.site_2a.id
 }

