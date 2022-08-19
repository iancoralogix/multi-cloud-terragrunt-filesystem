# multi-cloud-terragrunt-filesystem

An example of how to layout a Terragrunt repository to support multi-cloud in a single folder.

```
$ tree --filesfirst
.
├── terragrunt.hcl
├── aws
│   ├── providers.hcl
│   ├── development
│   │   └── us-east-2
│   └── production
│       ├── account.hcl
│       ├── us-east-1
│       │   ├── region.hcl
│       │   └── iangrunt
│       │       ├── current.hcl
│       │       ├── eks
│       │       │   └── terragrunt.hcl
│       │       └── vpc
│       │           └── terragrunt.hcl
│       └── us-west-2
└── gcp
    ├── data-science-projects
    │   ├── project-alpha
    │   └── project-gamma
    └── sre-projects
        └── project-delta
            ├── project.hcl
            ├── aws-data
            │   ├── README.md
            │   └── terragrunt.hcl
            └── vpc
                └── terragrunt.hcl
```

## How to use
```
$ terragrunt run-all apply
INFO[0000] The stack at /Users/gruntwork/terragrunt-examples/multi-cloud will be processed in the following order for command apply:
Group 1
- Module /Users/gruntwork/terragrunt-examples/multi-cloud/aws/production/us-east-1/vpc
- Module /Users/gruntwork/terragrunt-examples/multi-cloud/gcp/sre-projects/project-delta/vpc

Group 2
- Module /Users/gruntwork/terragrunt-examples/multi-cloud/aws/production/us-east-1/eks
- Module /Users/gruntwork/terragrunt-examples/multi-cloud/gcp/sre-projects/project-delta/aws-data
```
