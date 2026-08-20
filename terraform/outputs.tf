output "terraform_test_ecr_repository_url" {
  description = "ECR repository created by the Terraform smoke test"
  value       = aws_ecr_repository.terraform_test.repository_url
}
