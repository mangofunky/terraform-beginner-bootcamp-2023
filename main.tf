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

    tags = {
    UserUuid = var.user_uuid
  }

}

