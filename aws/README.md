# AWS cloud resources
This directory and all subdirectories contain AWS resources for our company.
```
.
├── README.md
├── organization
│   ├── account_factory
│   │   ├── account_factory.hcl
│   │   └── terragrunt.hcl
│   ├── organization.hcl
│   └── scps
│       ├── scps.hcl
│       └── terragrunt.hcl
├── providers.hcl
├── security-ou
│   ├── audit
│   │   └── account.hcl
│   └── security-tooling
│       └── account.hcl
└── workloads-ou
    ├── development
    │   ├── account.hcl
    │   └── us-west-2
    │       ├── region.hcl
    │       ├── team-a
    │       │   ├── aurora
    │       │   │   └── terragrunt.hcl
    │       │   ├── eks
    │       │   │   └── terragrunt.hcl
    │       │   ├── team-values.hcl
    │       │   └── vpc
    │       │       └── terragrunt.hcl
    │       └── team-b
    │           ├── aurora
    │           │   └── terragrunt.hcl
    │           ├── eks
    │           │   └── terragrunt.hcl
    │           ├── team-values.hcl
    │           └── vpc
    │               └── terragrunt.hcl
    ├── ou.hcl
    └── production
        ├── account.hcl
        └── us-east-1
            ├── region.hcl
            ├── team-a
            │   ├── aurora
            │   │   └── terragrunt.hcl
            │   ├── eks
            │   │   └── terragrunt.hcl
            │   ├── team-values.hcl
            │   └── vpc
            │       └── terragrunt.hcl
            └── team-b
                ├── aurora
                │   └── terragrunt.hcl
                ├── eks
                │   └── terragrunt.hcl
                ├── team-values.hcl
                └── vpc
                    └── terragrunt.hcl

27 directories, 30 files

```
