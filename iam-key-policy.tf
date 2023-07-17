resource "aws_kms_key_policy" "policy" {
  key_id = aws_kms_key.kms.key_id
  policy = local.autoscaling_policy == null ? local.policy : local.autoscaling_policy

  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
}
