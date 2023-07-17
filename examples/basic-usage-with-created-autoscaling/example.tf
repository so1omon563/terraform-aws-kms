provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "kms" {
  source  = "so1omon563/kms/aws"
  version = "2.0.0" # Replace with appropriate version
  # source = "../../"

  name = "example-kms"
  autoscaling = {
    autoscaling_needed                = true
    use_default_service_linked_role   = true
    create_custom_service_linked_role = false
  }

  tags = {
    example = "true"
  }
}

output "kms" {
  value = module.kms
}
