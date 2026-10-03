# Historical imports for this existing environment. IDs are intentionally fixed.

import {
  to = aws_cloudfront_distribution.website
  id = "EVN0BCIX8WGCI"
}

import {
  to = aws_s3_bucket.website
  id = "baris.hu"
}

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

import {
  to = aws_route53_zone.website
  id = "Z055509115YRHYYSUT0M6"
}

import {
  to = aws_cloudfront_origin_access_control.website
  id = "EUJESFBMVH2UI"
}

import {
  to = aws_route53_record.website_a
  id = "Z055509115YRHYYSUT0M6_baris.hu_A"
}

import {
  to = aws_s3_bucket_versioning.website
  id = "baris.hu"
}

import {
  to = aws_route53_record.website_aaaa
  id = "Z055509115YRHYYSUT0M6_baris.hu_AAAA"
}

import {
  to = aws_route53_record.website_ns
  id = "Z055509115YRHYYSUT0M6_baris.hu_NS"
}

import {
  to = aws_route53_record.website_soa
  id = "Z055509115YRHYYSUT0M6_baris.hu_SOA"
}

import {
  to = aws_route53_record.acm_root_validation
  id = "Z055509115YRHYYSUT0M6__6b183c3ff501ff0944ecd4703912ff64.baris.hu_CNAME"
}

import {
  to = aws_route53_record.acm_www_validation
  id = "Z055509115YRHYYSUT0M6__58273881b667415d31b2796cff257430.www.baris.hu_CNAME"
}

import {
  to       = aws_acm_certificate.website
  id       = "arn:aws:acm:us-east-1:997241705349:certificate/c19a7ab5-2a4c-4b1b-8b67-3b7affe0d3f4"
  provider = aws.us_east_1
}
