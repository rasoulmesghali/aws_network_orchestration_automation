output "vpc_id" {
  value = aws_vpc.main.id
}

output "sn_central_edge_a_ids" {
  value       = aws_subnet.central_edge_a.*.id
  description = "The ID of the central_edge_a Subnet."
}

output "sn_central_edge_b_ids" {
  value       = aws_subnet.central_edge_b.*.id
  description = "The ID of the central_edge_b Subnet."
}

output "sn_site_1b_ids" {
  value       = aws_subnet.site_1b.*.id
  description = "The ID of the 3rd site_1b Private Subnet."
}

output "sn_site_2b_ids" {
  value       = aws_subnet.site_2b.*.id
  description = "The ID of the site_2b Private Subnet."
}

output "sn_site_1a_ids" {
  value       = aws_subnet.site_1a.*.id
  description = "The ID of the site_1a Private Subnet."
}

output "sn_site_2a_ids" {
  value       = aws_subnet.site_2a.*.id
  description = "The ID of the site_2a Private Subnet."
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the internet gateway."
}

