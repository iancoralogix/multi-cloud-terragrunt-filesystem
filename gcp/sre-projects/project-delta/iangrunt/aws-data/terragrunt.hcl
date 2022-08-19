terraform {
  source = "git@github.com:iangrunt/terraform-null-input-output.git?ref=v0.0.1"
}

dependency "aws_vpc_production_use1" {
  config_path = "${get_repo_root()}/aws/production/us-east-1/iangrunt/vpc"

  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    id          = "vpc-fake123"
    name        = "fake-prod-use1-vpc"
    namespace   = "fake"
    environment = "prod"
  }
}

inputs = {
  input = {
    namespace               = "iangrunt"
    environment             = "prod"
    aws_vpc_production_use1 = "Hello from AWS! ${dependency.aws_vpc_production_use1.outputs.id}"
  }
}

