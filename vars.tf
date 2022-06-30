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
