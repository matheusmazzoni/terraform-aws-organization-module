locals {
  organization_units = [
    "stg",
  ]

  organization_accounts = {
    stg = {
      email       = "prd@example.com",
      parent_name = "stg"
      tags        = {
        Environment = "staging"
      }
    },
    prd = {
      email     = "prd@example.com",
    },
  }
}

module "organization" {
  source                = "../../"
  organization_accounts = local.organization_accounts
  organization_units    = local.organization_units
  organization_aws_service_access_principals = [
    "aws-artifact-account-sync.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "fms.amazonaws.com",
    "guardduty.amazonaws.com",
    "securityhub.amazonaws.com",
    "sso.amazonaws.com"
  ]
}