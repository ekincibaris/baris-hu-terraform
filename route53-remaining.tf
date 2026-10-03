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

resource "aws_route53_record" "website_aaaa" {
  zone_id = "Z055509115YRHYYSUT0M6"
  name    = "baris.hu"
  type    = "AAAA"

  alias {
    name                   = "d1n85obuitmcce.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "website_ns" {
  zone_id = "Z055509115YRHYYSUT0M6"
  name    = "baris.hu"
  type    = "NS"
  ttl     = 172800

  records = [
    "ns-1378.awsdns-44.org.",
    "ns-714.awsdns-25.net.",
    "ns-1743.awsdns-25.co.uk.",
    "ns-206.awsdns-25.com.",
  ]

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "website_soa" {
  zone_id = "Z055509115YRHYYSUT0M6"
  name    = "baris.hu"
  type    = "SOA"
  ttl     = 900

  records = [
    "ns-1378.awsdns-44.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "acm_root_validation" {
  zone_id = "Z055509115YRHYYSUT0M6"
  name    = "_6b183c3ff501ff0944ecd4703912ff64.baris.hu"
  type    = "CNAME"
  ttl     = 300

  records = [
    "_f119b10731ec6fccfffa88525bccab3e.jkddzztszm.acm-validations.aws."
  ]

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "acm_www_validation" {
  zone_id = "Z055509115YRHYYSUT0M6"
  name    = "_58273881b667415d31b2796cff257430.www.baris.hu"
  type    = "CNAME"
  ttl     = 300

  records = [
    "_b98c6eb2f349e898dd1f01445bece14b.jkddzztszm.acm-validations.aws."
  ]

  lifecycle {
    prevent_destroy = true
  }
}