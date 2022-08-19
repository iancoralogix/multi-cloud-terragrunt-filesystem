# These locals have to be defined in this file, so when it is included that they actually parse.
# If I didn't have this locals block, and instead had it at the module's terragrunt.hcl, it will
# not fill in the "${local.region}" correctly.

locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  project      = local.project_vars.locals.project
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "google" {
  project = "${local.project}"
}
EOF
}
