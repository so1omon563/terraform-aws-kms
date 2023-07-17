# KMS

Creates a KMS key that can be used across modules. Can also be used to create a custom Service Linked Role for Autoscaling that allows for using the generated key on encrypted AMIs.

Includes variables for modifying common KMS key settings, with best-practice defaults set for most of them. See the [variables](#variables) section for more information.

**It is not possible to directly migrate from a previous version of this module, without destroying / re-creaing keys, and pointing any key consuming resources to the new ARNs.**

The "service linked role only" options have been removed entirely, and the module now defaults to NOT create a custom service linked role.

If you wish to migrate from a previous version (< 2.0) of this module without destroying / re-creating resources, you may be able to accomplish this using `terraform state` commands to modify resources. This proces is beyond the scope of this README, and is not supported by the module maintainers.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Auto-generated technical documentation is created using [`terraform-docs`](https://terraform-docs.io/)
## Examples

```hcl
# See examples under the top level examples directory for more information on how to use this module.
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_service_linked_role.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_kms_alias.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_grant.autoscaling-created](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_grant) | resource |
| [aws_kms_key.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [random_id.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.autoscaling-created-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.autoscaling-default-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.default-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling"></a> [autoscaling](#input\_autoscaling) | Variable to determine if grants / policies for AutoScaling are needed. Note that if `autoscaling_needed` is set to `true`, it will override the **var.policy** variable. If you want to use a custom policy, ensure that `autoscaling_needed` is set to `false` and use the **var.policy** variable. If creating a custom service linked role, you must also set `use_default_service_linked_role` to `false`. | `map(bool)` | <pre>{<br>  "autoscaling_needed": false,<br>  "create_custom_service_linked_role": false,<br>  "use_default_service_linked_role": false<br>}</pre> | no |
| <a name="input_bypass_policy_lockout_safety_check"></a> [bypass\_policy\_lockout\_safety\_check](#input\_bypass\_policy\_lockout\_safety\_check) | If set to **true**, this will allow the module to bypass the policy lockout safety check. This is only needed if you are creating a key with a policy that denies access to the root user. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately. For more information, refer to the scenario in the [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam) section in the AWS Key Management Service Developer Guide. | `bool` | `false` | no |
| <a name="input_custom_key_store_id"></a> [custom\_key\_store\_id](#input\_custom\_key\_store\_id) | The ID of the CloudHSM cluster that you want to use as the custom key store for the KMS key. If you specify a **custom\_key\_store\_id** value, you must also set the **custom\_key\_store\_name** variable. | `string` | `null` | no |
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | Specifies the type of CMK to create. The default value, `SYMMETRIC_DEFAULT`, creates a CMK with a 256-bit symmetric key for encryption and decryption. For help choosing a key spec, see the [AWS KMS Developer Guide](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html). | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days. | `number` | `30` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the KMS key. If none is specified, a default description will be used. | `string` | `null` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. Defaults to **true**. | `bool` | `true` | no |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Specifies whether the key is enabled. Defaults to **true**. | `bool` | `true` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT`, `SIGN_VERIFY`, or `GENERATE_VERIFY_MAC`. Defaults to `ENCRYPT_DECRYPT`. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | If set to **true**, this will create a multi-region key. If set to **false**, this will create a regional key. Defaults to **false**. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Short, descriptive name of the environment. All resources will be named using this value as a prefix. | `string` | n/a | yes |
| <a name="input_name_override"></a> [name\_override](#input\_name\_override) | Used if there is a need to specify a KMS name outside of the standardized nomenclature. For example, if importing a key that doesn't follow the standard naming formats. | `string` | `null` | no |
| <a name="input_name_random"></a> [name\_random](#input\_name\_random) | If multiple keys using the same name need to be created in an environment, setting this as `true` will add a random hex to the `name` of the key. If using `name_override`, this value is ignored. | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid KMS key policy JSON document. If none is specified, and the AWS default policy, providing all principals in the owning account full access to al KMS operations, will be used. Although this is a key policy, not an IAM policy, an `aws_iam_policy_document`, in the form that designates a principal, can be used. For more information about building policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://developer.hashicorp.com/terraform/tutorials/aws/aws-iam-policy). | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_service_linked_role"></a> [iam\_service\_linked\_role](#output\_iam\_service\_linked\_role) | n/a |
| <a name="output_kms"></a> [kms](#output\_kms) | n/a |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
