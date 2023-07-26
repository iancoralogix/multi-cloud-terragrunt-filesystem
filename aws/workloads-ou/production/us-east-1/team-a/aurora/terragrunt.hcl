terraform {
  source = "git::git@github.com:gruntwork-io/terraform-fake-modules.git//modules/aws/aurora?ref=example"
}

dependency aws_vpc_production_use1 {
  config_path = "../vpc"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "vpc-fake123"
  }
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

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
  vpc_id = dependency.aws_vpc_production_use1.outputs.id
  tags   = local.tags
}
