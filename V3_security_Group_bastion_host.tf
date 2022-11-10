module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  name = "public-bastion-sg"

  vpc_id = module.vpc.vpc_id
  # Ingress rules and CIDR
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}