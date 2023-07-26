terraform {
  source = "git::git@github.com:iangrunt/terraform-null-input-output.git?ref=main"
}

dependency "aws_vpc_production_use1" {
  config_path = "${get_repo_root()}/aws/workloads-ou/production/us-east-1/team-a/vpc"

  mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply"]
  mock_outputs = {
    id          = "vpc-fake123"
    name        = "fake-vpc"
    namespace   = "fake"
    environment = "fake"
  }
}

inputs = {
  i = {
    aws_vpc_production_use1 = "Hello from AWS! ${dependency.aws_vpc_production_use1.outputs.id}"
  }
}

