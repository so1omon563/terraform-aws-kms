locals {
  tags                = var.tags
  account_id          = data.aws_caller_identity.current.account_id
  region              = data.aws_region.current.id
  additional_key_arns = var.additional_key_arns == null ? [] : toset(var.additional_key_arns)
  name                = lower(var.name_override != null ? var.name_override : var.name_random ? format("%s-%s-kms-key-%s", var.name, data.aws_region.current.name, random_id.random.hex) : format("%s-%s-kms-key", var.name, data.aws_region.current.name))
  description         = var.description != null ? var.description : format("KMS key for %s", var.name)
  policy              = var.policy != null ? var.policy : data.aws_iam_policy_document.default-policy.json
  autoscaling_poliy   = var.autoscaling.use_default_service_linked_role == true ? data.aws_iam_policy_document.autoscaling-default-policy.json : data.aws_iam_policy_document.autoscaling-created-policy.json
  # Only used for for_each to create the kms keys or not. Only care about the map key here, so the value is set to "ignore"
  kms = var.service_linked_role_only ? {} : { kms = "ignore" }

}
