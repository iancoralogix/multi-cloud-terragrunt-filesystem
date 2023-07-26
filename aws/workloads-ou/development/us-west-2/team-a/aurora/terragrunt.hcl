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

inputs = {
  vpc_id = dependency.aws_vpc_production_use1.outputs.id
}
