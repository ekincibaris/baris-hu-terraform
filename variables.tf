variable "domain_name" {
  description = "Domain and existing website bucket name. Changing this is a migration, not a cosmetic edit."
  type        = string
  default     = "baris.hu"
}
variable "aws_account_id" {
  description = "AWS account permitted for provider operations."
  type        = string
  default     = "997241705349"
  validation {
    condition     = can(regex("^[0-9]{12}$", var.aws_account_id))
    error_message = "Use a twelve-digit AWS account ID."
  }
}
variable "aws_region" {
  description = "Website S3 region. CloudFront certificates and WAF remain in us-east-1."
  type        = string
  default     = "eu-central-1"
}
locals {
  # Key by certificate domain, so apex/wildcard sharing one CNAME does not duplicate resources.
  acm_validation = {
    for option in aws_acm_certificate.website.domain_validation_options :
    option.domain_name => option
  }
}
