terraform {
  backend "s3" {
    bucket  = "praveen-ecommerce-terraform-state-743320495203"
    key     = "ecommerce/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
