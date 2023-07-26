terraform {
  source = "git::git@github.com:gruntwork-io/terraform-fake-modules.git//modules/aws/vpc?ref=example"
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

include "team_values" {
  path   = find_in_parent_folders("team-values.hcl")
  expose = true
}

locals {
  # Add the global tag from the root `terragrunt.hcl` into this `terragrunt.hcl` file.
  required_tags = include.root.locals.corporate_level_required_tags
  # Merge the required_tags defined in the root `terragrunt.hcl` with default tags that
  # are defined in the `providers.hcl` we want to override. In this case, the team
  # isn't the owner of the VPC, instead the SREs will be tagged as owners.
  tags = merge(local.required_tags, { Owner = "SRE", Namespace = "networking" })
}

inputs = {
  cidr_block = "10.33.0.0/16"
  tags       = local.tags
}
