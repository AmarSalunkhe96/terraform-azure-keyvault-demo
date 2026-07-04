# Terraform Azure Key Vault Demo

## Overview

This project demonstrates how to provision Azure infrastructure using Terraform with:

- Azure Resource Manager (AzureRM) Provider
- Azure Storage Account Remote Backend
- Azure Key Vault
- GitHub Actions
- Service Principal Authentication

## Resources Created

- Virtual Network
- Subnet
- Network Security Group
- NSG Association
- Public IP
- Network Interface
- Linux Virtual Machine

## Existing Resources Used

- Resource Group
- Storage Account
- Blob Container
- Azure Key Vault

## Secrets Retrieved from Key Vault

- vm-admin-username
- vm-admin-password

## Terraform Commands

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Create Execution Plan

```bash
terraform plan
```

Deploy Infrastructure

```bash
terraform apply
```

Destroy Infrastructure

```bash
terraform destroy
```