# Enable only after the state bucket exists. Backend arguments cannot use variables.
terraform {
  backend "s3" {
    bucket              = "baris-hu-terraform-state-997241705349-eu-central-1"
    key                 = "website/terraform.tfstate"
    region              = "eu-central-1"
    encrypt             = true
    use_lockfile        = true
    allowed_account_ids = ["997241705349"]
  }
}
