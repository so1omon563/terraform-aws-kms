variable "name" {}

variable "tags" {}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}

module "kms" {
  source = "../../../"
  tags   = var.tags
  name   = var.name
}

output "kms" { value = module.kms }

module "kms-created-autoscaling" {
  source        = "../../../"
  tags          = var.tags
  name          = var.name
  name_override = format("%s-created-autoscaling", var.name)
}

output "kms-created-autoscaling" { value = module.kms-created-autoscaling }

module "kms-default-autoscaling" {
  source        = "../../../"
  tags          = var.tags
  name          = var.name
  name_override = format("%s-default-autoscaling", var.name)
}

output "kms-default-autoscaling" { value = module.kms-default-autoscaling }

module "kms-override" {
  source        = "../../../"
  tags          = var.tags
  name          = var.name
  name_override = format("%s-override", var.name)
}

output "kms-override" { value = module.kms-override }

module "kms-random" {
  source      = "../../../"
  tags        = var.tags
  name        = var.name
  name_random = true
}

output "kms-random" { value = module.kms-random }
