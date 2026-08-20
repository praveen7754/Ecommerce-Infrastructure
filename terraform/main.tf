# Initial Terraform smoke test.
# We intentionally create only one ECR repository first.
# After Terraform/OIDC/S3 state is verified, this file will be expanded
# with VPC, EKS, RDS, security groups, ALB, IAM, and other modules.

resource "aws_ecr_repository" "terraform_test" {
  name                 = "ecommerce-terraform-test"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}
