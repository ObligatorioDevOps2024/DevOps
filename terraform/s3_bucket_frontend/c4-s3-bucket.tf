# Create S3 Bucket

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = var.s3_bucket_name
  #acl    = var.s3_bucket_acl

  tags = {
    "Name"    = var.s3_bucket_name
    "Purpose" = "Bucket para frontend"
  }
}
