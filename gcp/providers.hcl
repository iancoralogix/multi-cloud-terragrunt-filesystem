locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  project      = local.project_vars.locals.project
  region       = local.project_vars.locals.region
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "google" {
  project = "${local.project}"
  region = "${local.region}"
}
EOF
}
