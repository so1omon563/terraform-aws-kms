output "iam_service_linked_role" {
  value = { for key, value in aws_iam_service_linked_role.autoscaling : key => value }
}

output "kms" {
  value = {
    kms_key : { for key, value in aws_kms_key.kms : key => value }
    kms_key_alias : { for key, value in aws_kms_alias.kms : key => value }
  }
}

output "kms_grants" {
  value = {
    additional_keys = { for key, value in aws_kms_grant.autoscaling-additional : key => value }
  }
}
