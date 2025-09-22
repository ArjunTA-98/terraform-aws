output "s3_bucket_name" {
  value = aws_s3_bucket.arjun_website.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}