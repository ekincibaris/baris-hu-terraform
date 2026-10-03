# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route53_record" "website_a" {
  zone_id = "Z055509115YRHYYSUT0M6"
  name    = "baris.hu"
  type    = "A"

  alias {
    name                   = "d1n85obuitmcce.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }

  lifecycle {
    prevent_destroy = true
  }
}
