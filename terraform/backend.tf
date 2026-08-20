terraform {
  backend "s3" {
    # Replace this with the exact S3 bucket created for Terraform state.
    bucket       = "REPLACE_WITH_TERRAFORM_STATE_BUCKET"
    key          = "ecommerce/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
