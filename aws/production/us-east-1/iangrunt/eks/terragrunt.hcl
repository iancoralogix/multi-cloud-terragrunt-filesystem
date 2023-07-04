terraform {
  source = "git::git@github.com:gruntwork-io/terraform-fake-modules.git//modules/aws/eks?ref=main"
}

dependency aws_vpc_production_use1 {
  config_path = "../vpc"

  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    id = "vpc-fake123"
  }
}

include "providers" {
  path = find_in_parent_folders("providers.hcl")
}

include "current" {
  path   = find_in_parent_folders("current.hcl")
  expose = true
}

inputs = {
  namespace   = include.current.locals.namespace
  environment = include.current.locals.environment
  vpc_id      = dependency.aws_vpc_production_use1.outputs.id
}
