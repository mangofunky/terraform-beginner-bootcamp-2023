output "bucket_name" {
    value = module.home_music_hosting.bucket_name
}

output "website_endpoint" {
    description = "S3 Static Website hosting endpoint"
    value = module.home_music_hosting.website_endpoint  
}
output "cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.home_music_hosting.domain_name
}