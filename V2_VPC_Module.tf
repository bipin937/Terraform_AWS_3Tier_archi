module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.2.0"

  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnet
  public_subnets  = var.vpc_public_subnet



  database_subnets = var.vpc_db_subnet
  create_database_subnet_group = var.vpc_db_subnet_group
  create_database_nat_gateway_route = var.vpc_db_route_table

  enable_nat_gateway = true
  single_nat_gateway = true
  
  enable_dns_hostnames = true
  enable_dns_support = true

   


  tags = local.common_tags
  vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}