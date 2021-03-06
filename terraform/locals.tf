locals {
  vpc_name    = var.vpc_name
  create_dhcp = (var.create_dhcp == true ? 1 : 0)
  create_igw  = (var.create_igw == true && local.public_subnet_defined == true ? 1 : 0)

  public_subnet_defined = (local.enable_dynamic_subnets == false ? true : (length(var.public_subnets_a) > 0 || length(var.public_subnets_b) > 0 || length(var.public_subnets_c) > 0 ? true : false))


  # acl for entire VPC
  create_network_acl       = (var.create_network_acl == true ? 1 : 0)
  create_network_acl_rules = (var.create_network_acl == true && var.network_acl_rules != null ? length(var.network_acl_rules) : 0)

  # acl for private subnets
  create_private_subnet_acl       = (var.create_private_subnet_acl == true ? 1 : 0)
  create_private_subnet_acl_rules = (var.create_private_subnet_acl == true && var.private_subnet_acl_rules != null ? length(var.private_subnet_acl_rules) : 0)

  # acl for public subnets
  create_public_subnet_acl       = (var.create_public_subnet_acl == true ? 1 : 0)
  create_public_subnet_acl_rules = (var.create_public_subnet_acl == true && var.public_subnet_acl_rules != null ? length(var.public_subnet_acl_rules) : 0)

  # tgw
  accept_resource_share                                              = (var.create_tgw_attachment == true && var.accept_resource_share == true ? 1 : 0)
  # depends_on_aws_ram_resource_share_accepter_network_transit_gateway = (var.create_tgw_attachment == true && var.accept_resource_share == true ? aws_ram_resource_share_accepter.network_transit_gateway : null)
  create_tgw_attachment                                              = (var.create_tgw_attachment == true ? 1 : 0)
  create_tgw_attachment_without_ram                                  = (var.create_tgw_attachment_without_ram == true ? 1 : 0)
  create_private_tgw_routes                                          = (var.create_tgw_attachment == true && var.tgw_destination_cidr_blocks != [] ? length(var.tgw_destination_cidr_blocks) : 0)

  #Enable Dynamic Subnets:
  enable_dynamic_subnets = (length(var.private_subnets_a) > 0 || length(var.private_subnets_b) > 0 || length(var.private_subnets_c) > 0 || length(var.public_subnets_a) > 0 || length(var.public_subnets_b) > 0 || length(var.public_subnets_c) > 0 ? true : false)

  # Custom subnets
  # Private:
  sn_private_a = (local.enable_dynamic_subnets == false ? 1 : (length(var.private_subnets_a) > 0 ? length(var.private_subnets_a) : 0))
  sn_private_b = (local.enable_dynamic_subnets == false ? 1 : (length(var.private_subnets_b) > 0 ? length(var.private_subnets_b) : 0))
  sn_private_c = (local.enable_dynamic_subnets == false ? 1 : (length(var.private_subnets_c) > 0 ? length(var.private_subnets_c) : 0))

  # Public: 
  sn_public_a = (local.enable_dynamic_subnets == false ? 1 : (length(var.public_subnets_a) > 0 ? length(var.public_subnets_a) : 0))
  sn_public_b = (local.enable_dynamic_subnets == false ? 1 : (length(var.public_subnets_b) > 0 ? length(var.public_subnets_b) : 0))
  sn_public_c = (local.enable_dynamic_subnets == false ? 1 : (length(var.public_subnets_c) > 0 ? length(var.public_subnets_c) : 0))

  #igw_tags
  igw_tags = merge({ "Name" = var.vpc_name }, var.igw_tags)

  #nat_gw_tags
  nat_gw_tags = merge({ "Name" = var.vpc_name }, var.nat_gw_tags)

  # Route table tags
  rt_private_name = "Private Route"
  rt_public_name  = "Public Route"
  rt_private_tags = merge({ "Name" = local.rt_private_name }, var.rt_private_tags)
  rt_public_tags  = merge({ "Name" = local.rt_public_name }, var.rt_public_tags)

  # VPC Endpoints
  create_vpcep_s3 = (var.create_vpcep_s3 == true ? 1 : 0)
  vpcep_s3_tags   = merge({ "Name" = var.vpcep_s3_name }, var.vpcep_s3_tags)

  create_vpcep_dynamodb = (var.create_vpcep_dynamodb == true ? 1 : 0)
  vpcep_dynamodb_tags   = merge({ "Name" = var.vpcep_dynamodb_name }, var.vpcep_dynamodb_tags)

}
