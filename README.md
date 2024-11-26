# Terraform Infrastructure as Code

This repository contains Terraform configurations for creating an Azure Application Gateway on Azure, following infrastructure-as-code best practices with environment separation and modular resource management.

## Repository Structure

```
.
├── environments/
│   └── development/         # Development environment
│       ├── main.tf         # Main configuration file
│       ├── variables.tf    # Environment-specific variables
│       └── providers.tf    # Provider configuration
├── modules/                # Reusable module definitions
│   ├── appgateway/        # Application Gateway module
│   ├── entra_id/          # Entra ID (Azure AD) module
│   ├── network/           # Network infrastructure module
│   ├── pips/              # Public IPs module
│   └── resource-groups/   # Resource Groups module
└── README.md
```

## Architecture Overview

This infrastructure is designed with modularity and environment isolation in mind. Each resource type is encapsulated in its own module under the `modules/` directory, promoting reusability and maintainability. The environment-specific configurations are stored separately under the `environments/` directory.

### Key Components

- **Application Gateway**: Handles incoming traffic and routing
- **Network Infrastructure**: VNets, subnets, and network security configurations
- **Entra ID (Azure AD)**: Identity and access management
- **Public IPs**: Management of public IP addresses
- **Resource Groups**: Logical containers for related resources

## Getting Started

### Prerequisites

- Terraform >= 1.0.0
- Azure CLI
- Authentication configured for Azure

### Environment Setup

1. Initialize Terraform:
```bash
cd environments/development
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

## Environment Management

Currently, this repository manages the following environments:
- Development (`environments/development/`)

Each environment maintains its own state and variable definitions, ensuring complete isolation between different deployment stages.

## Module Usage

Each module is designed to be self-contained and reusable. To use a module, reference it in your environment's `main.tf`:

```hcl
module "resource_group" {
  source = "../../modules/resource-groups"
  # Module-specific variables
}
```

## Best Practices

This repository follows several Infrastructure as Code best practices:
- **Environment Separation**: Each environment has its own directory and state
- **Modularity**: Resources are grouped into logical, reusable modules
- **Configuration as Code**: All infrastructure changes are version-controlled
- **Variable Management**: Environment-specific variables are isolated

## Contributing

When contributing to this repository:
1. Create a new branch for your changes
2. Follow the existing module structure for new resources
3. Update documentation as needed
4. Test changes in development environment first
5. Submit a pull request for review

## Security

- Sensitive variables should be managed through Azure Key Vault or similar secure storage
- Follow the principle of least privilege when defining IAM roles
- Regularly update provider versions for security patches

