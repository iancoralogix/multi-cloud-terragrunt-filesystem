terraform {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/aws/vpc?ref=v1.0.0"
  #  source = "/Users/gruntwork/tf/terraform-fake-modules/modules/aws/vpc"
}

locals {
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

inputs = {
  namespace   = "iangrunt"
  environment = "prod"
  region      = local.region_vars.locals.region
}
