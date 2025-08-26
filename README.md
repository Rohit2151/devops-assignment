# DevOps Assignment – Terraform Infrastructure

This repository contains Terraform code to provision AWS infrastructure required for deploying a containerized web application with CI/CD, monitoring, and security best practices.  

---
**Infrastructure Components**

The Terraform configuration provisions the following resources in AWS:

- EC2 Instance
  - Ubuntu/Amazon Linux instance
  - IAM Role & Instance Profile attached
  - Security group allowing ports 22 (SSH), 80 (HTTP), 443 (HTTPS)

- S3 Bucket
  - Versioning enabled

- ECR Repository
  - Stores Docker images built via CI/CD
  - Image scanning enabled on push

- AM Role & Policies
  - EC2 role with permissions for:
    - Pulling images from ECR (`AmazonEC2ContainerRegistryReadOnly`)
    - Writing logs/metrics to CloudWatch (`CloudWatchAgentServerPolicy`)

---

**1. Initialize Terraform**
     terraform validate
     
**2. Validate Configuration**
     terraform validate
     
**3. Plan Deployment**
     terraform plan
     
**4. Terraform apply**
     terraform apply
