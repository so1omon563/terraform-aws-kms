resource "aws_kms_key" "kms" {
  for_each            = local.kms
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.kms-key-policy.json

  tags = merge({ "Name" = local.name }, local.tags)
}

resource "aws_kms_alias" "kms" {
  for_each      = local.kms
  name          = format("alias/%s", local.name)
  target_key_id = aws_kms_key.kms[each.key].key_id
}
