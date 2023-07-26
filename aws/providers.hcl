#
# Every module is represented by a terragrunt.hcl, and will include a block that looks like this:
#   include "providers" {
#     path = find_in_parent_folders("providers.hcl")
#   }
#
# Which will read this file to get access all these different values that are useful in the
# keeping this monorepo a logical layout of how AWS works. There are different values this modules
# need depending on their location. A module may need to know the region name but can't do a data
# call, so it can call "region.hcl" for that value, but also any values needed that are relevant
# to that region. "account.hcl" could hold things like the account ID, which can be used to lock
# down the AWS provider to ensure the expected modules only run in the correct environments.
# Add your account ID and uncomment the line in the `provider "aws"` block to try this.
#
# All these values can be overriden in the respective module's `terragrunt.hcl`. For example,
# the VPC module has this line, which overrides certain tags on the VPC it creates.

locals {
  ou_vars          = read_terragrunt_config(find_in_parent_folders("ou.hcl"))
  account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  team_values_vars = read_terragrunt_config(find_in_parent_folders("team-values.hcl"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.region_vars.locals.region_name}"
  default_tags {
    tags = {
      Account     = "${local.account_vars.locals.account_name}"
      Region      = "${local.region_vars.locals.region_name}"
      Environment = "${local.team_values_vars.locals.environment}"
      Namespace   = "${local.team_values_vars.locals.namespace}"
      Owner       = "${local.team_values_vars.locals.team_name}"
    }
  }

  # Define your account ID in `accounts.hcl` and
  # uncomment this line and remove one of the `$`'s below.
  # allowed_account_ids = ["$${local.account_vars.locals.account_id}"]
}
EOF
}
