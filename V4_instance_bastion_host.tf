module "public_bastion_host" {
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "public-bastion-host"

  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  vpc_security_group_ids = [module.public_bastion_sg.this_security_group_id]
  subnet_id = element(module.vpc.public_subnets, 0)

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}