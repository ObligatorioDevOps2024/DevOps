# Create S3 Bucket para Prod

resource "aws_s3_bucket" "my-s3-bucket-prod" {
  bucket = "prod-${var.s3_bucket_name}"

  tags = {
    "Name"    = "prod-${var.s3_bucket_name}"
    "Purpose" = "Bucket para frontend - Prod"
  }
}

