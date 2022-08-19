# multi-cloud-terragrunt-filesystem

```
$ tree
.
├── LICENSE
├── README.md
├── aws
│   ├── development
│   │   └── us-east-2
│   └── production
│       ├── us-east-1
│       │   ├── eks
│       │   │   └── terragrunt.hcl
│       │   ├── region.hcl
│       │   └── vpc
│       │       └── terragrunt.hcl
│       └── us-west-2
└── gcp
    ├── data-science-projects
    │   ├── project-alpha
    │   └── project-gamma
    └── sre-projects
        ├── project-delta
        │   ├── aws-data
        │   │   ├── README.md
        │   │   └── terragrunt.hcl
        │   ├── project.hcl
        │   └── vpc
        │       └── terragrunt.hcl
        └── project-epsilon
```
