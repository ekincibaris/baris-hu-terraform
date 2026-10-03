# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "Z055509115YRHYYSUT0M6"
resource "aws_route53_zone" "website" {
  comment                     = null
  delegation_set_id           = null
  enable_accelerated_recovery = false
  force_destroy               = null
  name                        = "baris.hu"
  tags                        = {}
  tags_all                    = {}
  lifecycle {
    prevent_destroy = true
  }
}
