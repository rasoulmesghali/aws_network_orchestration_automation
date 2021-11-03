 resource "aws_network_interface" "cr_2" {
   provisioner "local-exec" {
       command = "sleep 200"
   }
   subnet_id       = aws_subnet.central_edge_b.id
   private_ips     = ["10.0.2.10"]
   security_groups = [aws_security_group.allow_all.id]
   description     = "cr_2"
   source_dest_check = false
   attachment {
     instance     = aws_instance.centralRouter.id
     device_index = 1
   }
   tags = {
     "Name" = "cr_2"
   }
 }


 resource "aws_network_interface" "era_2" {
   provisioner "local-exec" {
       command = "sleep 200"
   }
   subnet_id       = aws_subnet.site_2a.id
   private_ips     = ["10.0.12.10"]
   security_groups = [aws_security_group.allow_all.id]
   description     = "era_2"
   source_dest_check = false
   attachment {
     instance     = aws_instance.edgeRouterA.id
     device_index = 1
   }
   tags = {
     "Name" = "era_2"
   }
 }

 resource "aws_network_interface" "erb_2" {
   provisioner "local-exec" {
       command = "sleep 200"
   }
   subnet_id       = aws_subnet.site_2b.id
   private_ips     = ["10.0.22.10"]
   security_groups = [aws_security_group.allow_all.id]
   description     = "erb_2"
   source_dest_check = false
   attachment {
     instance     = aws_instance.edgeRouterB.id
     device_index = 1
   }
   tags = {
     "Name" = "erb_2"
   }
 }