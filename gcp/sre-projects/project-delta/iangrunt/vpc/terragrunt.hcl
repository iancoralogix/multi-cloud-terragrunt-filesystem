terraform {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/gcp/vpc?ref=v1.0.0"
  #  source = "git@github.com:iangrunt/terraform-null-input-output.git?ref=v0.0.1"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# Automatically generate a provider that points to the correct region.
# Even if my session has region set to us-west-2, this will launch in
# us-east-1.
include "providers" {
  path = find_in_parent_folders("providers.hcl")
}

include "current" {
  path   = find_in_parent_folders("current.hcl")
  expose = true
}

locals {
  required_tags = include.root.locals.corporate_level_required_tags
  tags          = merge(local.required_tags, { team = "SRE" })
}

inputs = {
  #  namespace   = "iangrunt"
  #  environment = "prod"
  namespace   = include.current.locals.namespace
  environment = include.current.locals.environment
  cidr_block  = "10.2.0.0/16"
  tags        = local.tags
}
