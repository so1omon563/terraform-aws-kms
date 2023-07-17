provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "kms" {
  # source  = "so1omon563/kms/aws"
  # version = "2.0.0" # Replace with appropriate version
  source = "../../"

  name          = "example-kms"
  name_override = "example-kms-override"
  tags = {
    example = "true"
  }
}

output "kms" {
  value = module.kms
}
