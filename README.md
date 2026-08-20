# Ecommerce Infrastructure

Terraform infrastructure repository for the Ecommerce Application.

GitHub repository:
`praveen7754/Ecommerce-Infrastructure`

AWS account:
`743320495203`

AWS region:
`us-east-1`

## Repository architecture

Ecommerce-Application
- Application source
- Dockerfiles
- Application CI
- Docker image push to ECR

Ecommerce-Infrastructure
- Terraform
- AWS infrastructure
- Infrastructure CI/CD

## GitHub OIDC

Terraform uses the IAM role:

`GitHubActions-Terraform`

The role trust policy is restricted to:

`repo:praveen7754/Ecommerce-Infrastructure:ref:refs/heads/main`

No AWS access keys are required by GitHub Actions.

## Before first run

1. Create the S3 Terraform state bucket in `us-east-1`.
2. Keep Block Public Access enabled.
3. Enable S3 versioning.
4. Use SSE-S3 encryption.
5. Replace `REPLACE_WITH_TERRAFORM_STATE_BUCKET` in:
   - `terraform/backend.tf`
   - `IAM-GitHubActions-Terraform.json`
6. Create the IAM role `GitHubActions-Terraform`.
7. Use `IAM-Trust-Policy-GitHubActions-Terraform.json` as its trust policy.
8. Create and attach the permissions policy from `IAM-GitHubActions-Terraform.json`.
9. Push this repository to GitHub.
10. Run `Terraform Infrastructure` manually from GitHub Actions.

## Initial smoke test

The first Terraform apply creates only:

`ecommerce-terraform-test`

This is intentional.

After the smoke test succeeds, the infrastructure will be expanded in stages:

1. VPC
2. Public/private subnets
3. Internet Gateway
4. NAT Gateway
5. Route tables
6. Security groups
7. ECR repositories
8. EKS cluster
9. EKS node groups
10. RDS
11. ALB
12. IAM roles
13. CloudWatch
14. Route53/ACM when a domain is available

Do not add all production infrastructure before the OIDC and Terraform state test succeeds.
