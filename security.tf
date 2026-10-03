import {
  to = aws_s3_bucket_policy.website
  id = "baris.hu"
}

import {
  to = aws_s3_bucket_public_access_block.website
  id = "baris.hu"
}

import {
  to = aws_s3_bucket_server_side_encryption_configuration.website
  id = "baris.hu"
}

import {
  to = aws_s3_bucket_ownership_controls.website
  id = "baris.hu"
}

import {
  to       = aws_wafv2_web_acl.website
  id       = "96c51c54-0c76-4067-aa33-603e87935d8a/CreatedByCloudFront-fa76f528/CLOUDFRONT"
  provider = aws.us_east_1
}

resource "aws_s3_bucket_policy" "website" {
  bucket = "baris.hu"

  policy = jsonencode({
    Version = "2008-10-17"
    Id      = "PolicyForCloudFrontPrivateContent"

    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal"
        Effect = "Allow"

        Principal = {
          Service = "cloudfront.amazonaws.com"
        }

        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::baris.hu/*"

        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::997241705349:distribution/EVN0BCIX8WGCI"
          }
        }
      }
    ]
  })

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = "baris.hu"

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "website" {
  bucket = "baris.hu"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

    bucket_key_enabled       = true
    blocked_encryption_types = ["SSE-C"]
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = "baris.hu"

  rule {
    object_ownership = "BucketOwnerEnforced"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_wafv2_web_acl" "website" {
  provider = aws.us_east_1

  name  = "CreatedByCloudFront-fa76f528"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 0

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesAmazonIpReputationList"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesCommonRuleSet"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    }
  }

  visibility_config {
    sampled_requests_enabled   = true
    cloudwatch_metrics_enabled = true
    metric_name                = "CreatedByCloudFront-fa76f528"
  }

  lifecycle {
    prevent_destroy = true
  }
}