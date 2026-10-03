resource "aws_route53_record" "website_a" {
  zone_id = aws_route53_zone.website.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "website_aaaa" {
  zone_id = aws_route53_zone.website.zone_id
  name    = var.domain_name
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "website_ns" {
  zone_id = aws_route53_zone.website.zone_id
  name    = var.domain_name
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
  zone_id = aws_route53_zone.website.zone_id
  name    = var.domain_name
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
  zone_id = aws_route53_zone.website.zone_id
  name    = trimsuffix(local.acm_validation[var.domain_name].resource_record_name, ".")
  type    = "CNAME"
  ttl     = 300

  records = [
    local.acm_validation[var.domain_name].resource_record_value
  ]

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "acm_www_validation" {
  zone_id = aws_route53_zone.website.zone_id
  name    = trimsuffix(local.acm_validation["www.${var.domain_name}"].resource_record_name, ".")
  type    = "CNAME"
  ttl     = 300

  records = [
    local.acm_validation["www.${var.domain_name}"].resource_record_value
  ]

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "website_www_a" {
  zone_id = aws_route53_zone.website.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "website_www_aaaa" {
  zone_id = aws_route53_zone.website.zone_id
  name    = "www.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }

  lifecycle {
    prevent_destroy = true
  }
}
