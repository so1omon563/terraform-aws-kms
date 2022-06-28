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
