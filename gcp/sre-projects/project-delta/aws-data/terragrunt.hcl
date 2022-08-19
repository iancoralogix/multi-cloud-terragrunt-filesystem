terraform {
  source = "git@github.com:iangrunt/terraform-null-input-output.git?ref=v0.0.1"
}

dependency "aws_vpc_use1" {
  config_path = ""
}

locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
}

inputs = {
  input = {
    namespace   = "iangrunt"
    environment = "prod"
    project     = local.project_vars.locals.project_id
  }
}

