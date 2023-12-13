terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    aws = {
     source = "hashicorp/aws"
     version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "random" {
  #https://registry.terraform.io/providers/hashicorp/random/latest/docs
  # Configuration options
}

resource "random_string" "bucket_name" {
  # https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
  length = 32
  upper = false
  special = false
}
 # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "S3-Bucket" {
  # Bucket Naming Rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result

}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}