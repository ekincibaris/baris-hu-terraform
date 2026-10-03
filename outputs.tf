output "website_url" {
  description = "Public HTTPS URL."
  value       = "https://${var.domain_name}"
}
output "website_bucket" {
  description = "Bucket used for site deployments."
  value       = aws_s3_bucket.website.id
}
output "cloudfront_distribution_id" {
  description = "Distribution ID for cache invalidations."
  value       = aws_cloudfront_distribution.website.id
}
output "cloudfront_domain" {
  description = "CloudFront origin for DNS aliases."
  value       = aws_cloudfront_distribution.website.domain_name
}
output "route53_zone_id" {
  description = "Managed public hosted zone."
  value       = aws_route53_zone.website.zone_id
}
