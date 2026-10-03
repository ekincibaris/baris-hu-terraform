# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "EVN0BCIX8WGCI"
resource "aws_cloudfront_distribution" "website" {
  aliases             = ["baris.hu", "www.baris.hu"]
  anycast_ip_list_id  = null
  comment             = null
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  staging             = false
  tags = {
    Name = "baris.hu"
  }

  wait_for_deployment = true
  web_acl_id          = "arn:aws:wafv2:us-east-1:997241705349:global/webacl/CreatedByCloudFront-fa76f528/96c51c54-0c76-4067-aa33-603e87935d8a"
  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }
  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }
  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods             = ["GET", "HEAD"]
    compress                   = true
    default_ttl                = 0
    field_level_encryption_id  = null
    max_ttl                    = 0
    min_ttl                    = 0
    origin_request_policy_id   = null
    realtime_log_config_arn    = null
    response_headers_policy_id = null
    smooth_streaming           = false
    target_origin_id           = "baris.hu.s3.eu-central-1.amazonaws.com-mmj3fo0qef5"
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = "redirect-to-https"
    grpc_config {
      enabled = false
    }
  }
  origin {
    connection_attempts         = 3
    connection_timeout          = 10
    domain_name                 = "baris.hu.s3.eu-central-1.amazonaws.com"
    origin_access_control_id    = "EUJESFBMVH2UI"
    origin_id                   = "baris.hu.s3.eu-central-1.amazonaws.com-mmj3fo0qef5"
    origin_path                 = null
    response_completion_timeout = 0
  }
  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:997241705349:certificate/c19a7ab5-2a4c-4b1b-8b67-3b7affe0d3f4"
    cloudfront_default_certificate = false
    iam_certificate_id             = null
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
  lifecycle {
    prevent_destroy = true
  }
}

