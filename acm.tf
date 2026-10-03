# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "arn:aws:acm:us-east-1:997241705349:certificate/c19a7ab5-2a4c-4b1b-8b67-3b7affe0d3f4"
resource "aws_acm_certificate" "website" {
  provider                  = aws.us_east_1
  certificate_authority_arn = null
  certificate_body          = null
  certificate_chain         = null
  domain_name               = "baris.hu"
  early_renewal_duration    = null
  key_algorithm             = "RSA_2048"
  private_key               = null # sensitive
  private_key_wo            = null
  private_key_wo_version    = null
  region                    = "us-east-1"
  subject_alternative_names = ["*.baris.hu", "baris.hu", "www.baris.hu"]
  tags                      = {}
  tags_all                  = {}
  validation_method         = "DNS"
  options {
    certificate_transparency_logging_preference = "ENABLED"
    export                                      = "DISABLED"
  }
  lifecycle {
    prevent_destroy = true
  }
}
