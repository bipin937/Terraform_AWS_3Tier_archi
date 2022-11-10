locals {
  owners = var.business_divsion
  environment = var.environment

  name = "${var.environment}-${var.business_divsion}"

  common_tags = {

    owners = local.owners
    environment = local.environment



  }
}