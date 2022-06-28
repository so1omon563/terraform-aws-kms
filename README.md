# KMS

Creates a KMS key that can be used across modules. Also creates a Service Linked Role for Autoscaling that allows for using the generated key on encrypted AMIs.

The module is also able to provide grants to a list of additional KMS keys to attach to the Service Linked Role, or create the role with only a provided list - rather than create a key.

## Put info about snapshot / ami kms lookup module here once complete

Examples for use can be found under the [examples](https://github.com/so1omon563/terraform-aws-kms/tree/main/examples) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Auto-generated technical documentation is created using [`terraform-docs`](https://terraform-docs.io/)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_service_linked_role.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_kms_alias.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_grant.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_grant) | resource |
| [aws_kms_grant.autoscaling-additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_grant) | resource |
| [aws_kms_key.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.kms-key-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_key_arns"></a> [additional\_key\_arns](#input\_additional\_key\_arns) | A list of additional KMS keys to grant the Service Linked Role access to. Only accepts full KMS key ARNs. | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Short, descriptive name of the environment. All resources will be named using this value as a prefix. | `string` | n/a | yes |
| <a name="input_service_linked_role_only"></a> [service\_linked\_role\_only](#input\_service\_linked\_role\_only) | If set to **true**, this will ONLY create the Service Linked Role with grants for the list of ARNs in **var.additional\_key\_arns**. Can be used if you have KMS keys managed outside of this module. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_service_linked_role"></a> [iam\_service\_linked\_role](#output\_iam\_service\_linked\_role) | n/a |
| <a name="output_kms"></a> [kms](#output\_kms) | n/a |
| <a name="output_kms_grants"></a> [kms\_grants](#output\_kms\_grants) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
