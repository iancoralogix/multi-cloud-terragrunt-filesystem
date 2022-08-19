terraform {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/gcp/vpc?ref=v1.0.0"
  #  source = "git@github.com:iangrunt/terraform-null-input-output.git?ref=v0.0.1"
}

locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
}

inputs = {
  namespace   = "iangrunt"
  environment = "prod"
  project     = local.project_vars.locals.project_id
}
