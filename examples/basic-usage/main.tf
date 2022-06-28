provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "kms" {
  source = "../../" # Change

  name = "example-kms"
  tags = {
    example = "true"
  }
}

output "kms" {
  value = module.kms
}
