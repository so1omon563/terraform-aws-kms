locals {
  tags       = var.tags
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.id
  additional_key_arns = var.additional_key_arns == null ? [] : toset(var.additional_key_arns)

  # Only used for for_each to create the kms keys or not. Only care about the map key here, so the value is set to "ignore"
  kms = var.service_linked_role_only ? {} : { kms = "ignore" }
}
