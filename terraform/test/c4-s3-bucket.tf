# S3 Bucket para Test
resource "aws_s3_bucket" "my-s3-bucket-test" {
  bucket = "test-${var.s3_bucket_name}"

  tags = {
    "Name"    = "test-${var.s3_bucket_name}"
    "Purpose" = "Bucket para frontend - Test"
  }
}
