variable "name" {
  type        = string
  description = "Short, descriptive name of the environment. All resources will be named using this value as a prefix."
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}

variable "additional_key_arns" {
  type        = list(string)
  description = "A list of additional KMS keys to grant the Service Linked Role access to. Only accepts full KMS key ARNs."
  default     = null
}

variable "service_linked_role_only" {
  type        = bool
  description = "If set to **true**, this will ONLY create the Service Linked Role with grants for the list of ARNs in **var.additional_key_arns**. Can be used if you have KMS keys managed outside of this module."
  default     = false
}

# variable "region_kms" {
#   type = map(string)
#   default = {
#     ap-northeast-1 = "arn:aws:kms:ap-northeast-1:056952386373:key/c0b477c0-7bfa-4573-9b82-18572bbce4b9"
#     ap-northeast-2 = "arn:aws:kms:ap-northeast-2:056952386373:key/26d72d17-8e4e-4468-92f9-379f9da5f408"
#     ap-south-1     = "arn:aws:kms:ap-south-1:056952386373:key/2ef589fb-a821-451c-bbd7-82a5bd99e325"
#     ap-southeast-1 = "arn:aws:kms:ap-southeast-1:056952386373:key/b56d4f2f-2510-4d4e-9a71-c227c7e59f9c"
#     ap-southeast-2 = "arn:aws:kms:ap-southeast-2:056952386373:key/5db00bfd-96a3-4a27-b770-7b084212710b"
#     ca-central-1   = "arn:aws:kms:ca-central-1:056952386373:key/adbf0572-6adc-4424-9757-5cfde6f59b84"
#     eu-central-1   = "arn:aws:kms:eu-central-1:056952386373:key/111f5ed8-e93f-4762-809e-31d942dcd784"
#     eu-north-1     = "arn:aws:kms:eu-north-1:056952386373:key/52a8fcba-b752-4752-8f8f-5fc0735d59b1"
#     eu-west-1      = "arn:aws:kms:eu-west-1:056952386373:key/75e357fd-aa2f-4277-aa3d-c599b4198dde"
#     eu-west-2      = "arn:aws:kms:eu-west-2:056952386373:key/10acf7f5-d9e1-4639-a7b2-acb6733aee41"
#     eu-west-3      = "arn:aws:kms:eu-west-3:056952386373:key/c1427347-3ecc-4a2f-9d82-462ae5d31c1b"
#     sa-east-1      = "arn:aws:kms:sa-east-1:056952386373:key/1fabb437-560d-44bf-b79d-695356386f82"
#     us-east-1      = "arn:aws:kms:us-east-1:056952386373:key/0f0224cd-e20a-4011-bb5e-6bead7fb9747"
#     us-east-2      = "arn:aws:kms:us-east-2:056952386373:key/0182d9ce-0f1e-42f4-b277-12fcdc085d64"
#     us-west-1      = "arn:aws:kms:us-west-1:056952386373:key/1f3edc87-9ceb-4960-b759-57cbb1ecd077"
#     us-west-2      = "arn:aws:kms:us-west-2:056952386373:key/0c87545b-fb11-444c-b88c-14e0b8b32aec"
#   }
# }
