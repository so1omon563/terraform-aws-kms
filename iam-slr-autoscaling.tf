resource "aws_iam_service_linked_role" "autoscaling" {
  aws_service_name = "autoscaling.amazonaws.com"
  custom_suffix    = format("%s-%s", var.name, data.aws_region.current.name)
}

resource "aws_kms_grant" "autoscaling" {
  for_each          = local.kms
  name              = format("%s-%s", var.name, data.aws_region.current.name)
  key_id            = aws_kms_key.kms[each.key].id
  grantee_principal = aws_iam_service_linked_role.autoscaling.id
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "ReEncryptTo", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant"]
}

resource "aws_kms_grant" "autoscaling-additional" {
  for_each          = local.additional_key_arns
  name              = format("%s-%s-%s", var.name, each.value, data.aws_region.current.name)
  key_id            = each.value
  grantee_principal = aws_iam_service_linked_role.autoscaling.id
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "ReEncryptTo", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant"]
}
