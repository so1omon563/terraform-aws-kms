# Basic usage

Basic usage example.

Example shows using Default Tags in the provider as well as passing additional tags into the resource.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Examples

```hcl
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
  tags = {
    example = "true"
  }
}

output "kms" {
  value = module.kms
}
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | so1omon563/kms/aws | 2.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms"></a> [kms](#output\_kms) | n/a |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
