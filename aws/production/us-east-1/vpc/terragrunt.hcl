terraform {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/aws/vpc?ref=v1.0.0"
  #  source = "/Users/gruntwork/tf/terraform-fake-modules/modules/aws/vpc"
}

include "providers" {
  path = find_in_parent_folders("providers.hcl")
}

inputs = {
  namespace   = "iangrunt"
  environment = "prod"
}
