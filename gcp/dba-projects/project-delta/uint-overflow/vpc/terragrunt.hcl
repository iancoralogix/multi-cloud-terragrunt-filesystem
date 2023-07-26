terraform {
  source = "git::git@github.com:gruntwork-io/terraform-fake-modules.git//modules/gcp/vpc?ref=main"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

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
  namespace   = include.current.locals.namespace
  environment = include.current.locals.environment
  cidr_block  = "10.77.0.0/16"
  tags        = local.tags
}
