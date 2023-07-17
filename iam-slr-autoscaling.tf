resource "aws_iam_service_linked_role" "autoscaling" {
  count            = var.autoscaling.create_custom_service_linked_role ? 1 : 0
  aws_service_name = "autoscaling.amazonaws.com"
  custom_suffix    = local.name
  tags             = local.tags
}

resource "aws_kms_grant" "autoscaling-created" {
  count             = var.autoscaling.create_custom_service_linked_role ? 1 : 0
  name              = local.name
  key_id            = aws_kms_key.kms.id
  grantee_principal = aws_iam_service_linked_role.autoscaling[count.index].id
  operations        = ["Encrypt", "Decrypt", "ReEncryptFrom", "ReEncryptTo", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "DescribeKey", "CreateGrant"]
}
