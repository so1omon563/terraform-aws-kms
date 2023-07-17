variable "autoscaling" {
  type        = map(bool)
  description = "Variable to determine if grants / policies for AutoScaling are needed. Note that if `autoscaling_needed` is set to `true`, it will override the **var.policy** variable. If you want to use a custom policy, ensure that `autoscaling_needed` is set to `false` and use the **var.policy** variable. If creating a custom service linked role, you must also set `use_default_service_linked_role` to `false`."
  default = {
    "autoscaling_needed"                = false
    "use_default_service_linked_role"   = false,
    "create_custom_service_linked_role" = false,
  }
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  description = "If set to **true**, this will allow the module to bypass the policy lockout safety check. This is only needed if you are creating a key with a policy that denies access to the root user. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately. For more information, refer to the scenario in the [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam) section in the AWS Key Management Service Developer Guide."
  default     = false
}

variable "custom_key_store_id" {
  type        = string
  description = "The ID of the CloudHSM cluster that you want to use as the custom key store for the KMS key. If you specify a **custom_key_store_id** value, you must also set the **custom_key_store_name** variable."
  default     = null
}

variable "customer_master_key_spec" {
  type        = string
  description = "Specifies the type of CMK to create. The default value, `SYMMETRIC_DEFAULT`, creates a CMK with a 256-bit symmetric key for encryption and decryption. For help choosing a key spec, see the [AWS KMS Developer Guide](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)."
  validation {
    condition = contains(
      ["SYMMETRIC_DEFAULT",
        "RSA_2048",
        "RSA_3072",
        "RSA_4096",
        "ECC_NIST_P256",
        "ECC_NIST_P384",
        "ECC_NIST_P521",
        "ECC_SECG_P256K1",
        "HMAC_256"
      ],
    var.customer_master_key_spec)
    error_message = "Valid values are limited to (SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, ECC_SECG_P256K1, HMAC_256)."
  }
  default = "SYMMETRIC_DEFAULT"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  default     = 30
}

variable "description" {
  type        = string
  description = "Description of the KMS key. If none is specified, a default description will be used."
  default     = null
}

variable "enable_key_rotation" {
  type        = bool
  description = "Specifies whether key rotation is enabled. Defaults to **true**."
  default     = true
}

variable "is_enabled" {
  type        = bool
  description = "Specifies whether the key is enabled. Defaults to **true**."
  default     = true
}
variable "key_usage" {
  type        = string
  description = "Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT`, `SIGN_VERIFY`, or `GENERATE_VERIFY_MAC`. Defaults to `ENCRYPT_DECRYPT`."
  validation {
    condition = contains(
      ["ENCRYPT_DECRYPT",
        "SIGN_VERIFY",
        "GENERATE_VERIFY_MAC",
      ],
    var.key_usage)
    error_message = "Valid values are limited to (ENCRYPT_DECRYPT, SIGN_VERIFY, GENERATE_VERIFY_MAC)."
  }
  default = "ENCRYPT_DECRYPT"
}

variable "multi_region" {
  type        = bool
  description = "If set to **true**, this will create a multi-region key. If set to **false**, this will create a regional key. Defaults to **false**."
  default     = false
}

variable "name" {
  type        = string
  description = "Short, descriptive name of the environment. All resources will be named using this value as a prefix."
}

variable "name_override" {
  type        = string
  description = "Used if there is a need to specify a KMS name outside of the standardized nomenclature. For example, if importing a key that doesn't follow the standard naming formats."
  default     = null
}

variable "name_random" {
  type        = bool
  description = "If multiple keys using the same name need to be created in an environment, setting this as `true` will add a random hex to the `name` of the key. If using `name_override`, this value is ignored."
  default     = false
}

variable "policy" {
  type        = string
  description = "A valid KMS key policy JSON document. If none is specified, and the AWS default policy, providing all principals in the owning account full access to al KMS operations, will be used. Although this is a key policy, not an IAM policy, an `aws_iam_policy_document`, in the form that designates a principal, can be used. For more information about building policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://developer.hashicorp.com/terraform/tutorials/aws/aws-iam-policy)."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}
