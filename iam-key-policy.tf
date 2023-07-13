# # Policy document for a created AutoScaling Service Linked Role. Not needed if using the default.
# data "aws_iam_policy_document" "kms-key-policy" {
#   #checkov:skip=CKV_AWS_109:In this shared module, this is by design. These policies are for autoscaling, so the resources are not locked down.
#   #checkov:skip=CKV_AWS_111:In this shared module, this is by design. These policies are for autoscaling, so the resources are not locked down.
#   statement {

#     principals {
#       type = "AWS"
#       identifiers = [
#         format("arn:aws:iam::%s:root", data.aws_caller_identity.current.account_id)
#       ]
#     }

#     actions = [
#       "kms:*",
#     ]

#     resources = [
#       "*",
#     ]
#   }

#   statement {

#     principals {
#       type = "AWS"
#       identifiers = [
#         aws_iam_service_linked_role.autoscaling.arn
#       ]
#     }
#     principals {
#       type = "Service"
#       identifiers = [
#         format("logs.%s.amazonaws.com", local.region)
#       ]
#     }

#     actions = [
#       "kms:Encrypt",
#       "kms:Decrypt",
#       "kms:ReEncrypt*",
#       "kms:GenerateDataKey*",
#       "kms:DescribeKey",
#     ]

#     resources = [
#       "*",
#     ]
#   }

#   statement {

#     principals {
#       type = "AWS"
#       identifiers = [
#         aws_iam_service_linked_role.autoscaling.arn
#       ]
#     }

#     actions = [
#       "kms:CreateGrant",
#     ]

#     resources = [
#       "*",
#     ]
#     condition {
#       test     = "Bool"
#       variable = "kms:GrantIsForAWSResource"

#       values = [
#         "true",
#       ]
#     }

#   }
# }
