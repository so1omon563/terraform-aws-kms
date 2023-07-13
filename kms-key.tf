resource "aws_kms_key" "kms" {
  for_each                           = local.kms
  description                        = local.description
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  custom_key_store_id                = var.custom_key_store_id
  customer_master_key_spec           = var.customer_master_key_spec
  deletion_window_in_days            = var.deletion_window_in_days
  enable_key_rotation                = var.enable_key_rotation
  is_enabled                         = var.is_enabled
  key_usage                          = var.key_usage
  multi_region                       = var.multi_region
  # policy              = data.aws_iam_policy_document.kms-key-policy.json

  tags = merge({ "Name" = local.name }, local.tags)
}

resource "aws_kms_alias" "kms" {
  for_each      = local.kms
  name          = format("alias/%s", local.name)
  target_key_id = aws_kms_key.kms[each.key].key_id
}
