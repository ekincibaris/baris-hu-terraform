resource "aws_acm_certificate" "website" {
  provider                  = aws.us_east_1
  domain_name               = var.domain_name
  key_algorithm             = "RSA_2048"
  region                    = "us-east-1"
  subject_alternative_names = ["*.${var.domain_name}", var.domain_name, "www.${var.domain_name}"]
  tags                      = {}
  validation_method         = "DNS"
  options {
    certificate_transparency_logging_preference = "ENABLED"
    export                                      = "DISABLED"
  }
  lifecycle {
    prevent_destroy = true
  }
}
