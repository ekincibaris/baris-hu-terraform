resource "aws_route53_zone" "website" {
  enable_accelerated_recovery = false
  name                        = var.domain_name
  tags                        = {}
  lifecycle {
    prevent_destroy = true
  }
}
