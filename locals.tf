locals {
  tags               = var.tags
  account_id         = data.aws_caller_identity.current.account_id
  region             = data.aws_region.current.id
  name               = lower(var.name_override != null ? var.name_override : var.name_random ? format("%s-%s-kms-key-%s", var.name, data.aws_region.current.name, random_id.random.hex) : format("%s-%s-kms-key", var.name, data.aws_region.current.name))
  description        = var.description != null ? var.description : format("KMS key for %s", var.name)
  policy             = var.policy != null ? var.policy : data.aws_iam_policy_document.default-policy.json
  autoscaling_policy = var.autoscaling.autoscaling_needed == false ? null : var.autoscaling.use_default_service_linked_role == true ? data.aws_iam_policy_document.autoscaling-default-policy.json : data.aws_iam_policy_document.autoscaling-created-policy[0].json

}
