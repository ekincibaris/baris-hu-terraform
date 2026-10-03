resource "aws_cloudfront_origin_access_control" "website" {
  name                              = "oac-baris.hu.s3.eu-central-1.amazonaws.com-mmj3isuafjz"
  description                       = "Created by CloudFront"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"

  lifecycle {
    prevent_destroy = true
  }
}
