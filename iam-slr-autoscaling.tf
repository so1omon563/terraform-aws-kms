resource "aws_iam_service_linked_role" "autoscaling" {
  aws_service_name = "autoscaling.amazonaws.com"
  custom_suffix    = local.name
  tags             = local.tags
}

resource "aws_kms_grant" "autoscaling-created" {
  for_each          = local.kms
  name              = local.name
  key_id            = aws_kms_key.kms[each.key].id
  grantee_principal = aws_iam_service_linked_role.autoscaling.id
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "ReEncryptTo", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant"]
}

resource "aws_kms_grant" "autoscaling-created-additional" {
  for_each          = local.additional_key_arns
  name              = format("%s-%s", local.name, each.value)
  key_id            = each.value
  grantee_principal = aws_iam_service_linked_role.autoscaling.id
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "ReEncryptTo", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant"]
}
