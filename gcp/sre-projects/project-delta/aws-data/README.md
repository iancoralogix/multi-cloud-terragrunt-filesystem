# Get AWS data into GCP via Terragrunt Dependency
By data, we mean values Terraform can typically access, like outputs from a VPC module that was created. We use a `dependency` block to setup that association and access those values via the cloud-filesystem.
