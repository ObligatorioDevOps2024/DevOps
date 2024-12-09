# S3 Bucket front para Dev
resource "aws_s3_bucket" "my-s3-bucket-dev" {
  bucket = var.s3_bucket_name

  tags = {
    "Name"    = var.s3_bucket_name
    "Purpose" = "Bucket para frontend - Dev"
  }
}
