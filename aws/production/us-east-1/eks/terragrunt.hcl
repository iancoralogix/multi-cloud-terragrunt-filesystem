terraform {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/aws/eks?ref=v1.0.0"
  #  source = "/Users/gruntwork/tf/terraform-fake-modules/modules/aws/eks"
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

inputs = {
  namespace   = "iangrunt"
  environment = "prod"
  vpc_id      = dependency.aws_vpc_production_use1.outputs.id
}
