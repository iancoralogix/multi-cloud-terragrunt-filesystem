# Terraform & Terragrunt GCP Example

This repository contains example code for managing Google Cloud Platform (GCP) resources using Terraform and Terragrunt.

## Prerequisites

- A valid GCP account associated with a billing account.
- GCP projects for which you have administrative access. These projects will be used to demonstrate the functionalities of the example code.
- The Google Cloud SDK (gcloud) installed and configured. You can find instructions on how to do this [here](https://cloud.google.com/sdk/docs/install).
- Terraform and Terragrunt installed. You can find installation instructions for Terraform [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) and for Terragrunt [here](https://terragrunt.gruntwork.io/docs/getting-started/install/).

## Setup

Before you begin, you'll need to authenticate to GCP via the `gcloud` CLI:

```bash
gcloud auth application-default login
```

### Compute Engine API

The Google Compute Engine API is required for this project to make several `data` calls to construct the necessary values for our infrastructure.

Enable the Compute Engine API by running:

```bash
gcloud services enable compute.googleapis.com
```

## Usage

Once you have the prerequisites installed and the setup completed, navigate to the directory containing the Terragrunt and Terraform files. Replace the Gruntwork managed project IDs with your own valid GCP project IDs and then run:

```bash
terragrunt run-all plan
```

This will show you a preview of the changes that Terraform will make to your infrastructure. If you're happy with these changes, apply them by running:

```bash
terragrunt run-all apply
```

You'll be asked to confirm that you want to make these changes. Type `yes` to proceed.

## Cleanup

To remove the infrastructure that was created, run:

```bash
terragrunt destroy
```

You'll be asked to confirm that you want to destroy your infrastructure. Type `yes` to proceed.

## Important

Remember to replace the Gruntwork managed project IDs with your own valid GCP project IDs before running any `terragrunt` commands.
