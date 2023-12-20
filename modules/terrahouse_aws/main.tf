terraform {
  required_providers {
    aws = {
     source = "hashicorp/aws"
     version = "5.30.0"
    }
  }
}

# provider "aws" {
#   region = "us-east-1"
# } 
 # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "website_bucket" {
  # Bucket Naming Rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = var.bucket_name
  
      tags = {
    UserUuid = var.user_uuid
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}