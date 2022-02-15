variable "organization_units" {
  type = list(string)
  default = []
  description = "(optional)"
}

variable "organization_accounts" {
  type = any
  default = {
    production = {
      email = "prd@example.com",
    },
    staging = {
      email = "stg@example.com",
    },
    development = {
      email = "dev@example.com",
    },
  }
  description = "(optional)"
}

variable "organization_aws_service_access_principals" {
  default = [
    "cloudtrail.amazonaws.com",
    "sso.amazonaws.com"
  ]
}

variable "organization_feature_set" {
  description = "Specify ALL or CONSOLIDATED_BILLING"
  type        = string
  default     = "ALL"
}

variable "organization_enabled_policy_types" {
  description = "List of Organizations policy types to enable in the Organization Root. Organization must have feature_set set to ALL. For additional information about valid policy types (e.g. AISERVICES_OPT_OUT_POLICY, BACKUP_POLICY, SERVICE_CONTROL_POLICY, and TAG_POLICY)"
  type        = list(string)
  default = [
    "SERVICE_CONTROL_POLICY"
  ]
}