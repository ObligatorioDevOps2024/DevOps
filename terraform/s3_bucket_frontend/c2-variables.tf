# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Bucket para frontend de obligatorio"
  type        = string
  default     = "front-obligatorio"
}

/*variable "s3_bucket_acl" {
  description = "Access control list for the S3 Bucket"
  type        = string
  default     = "private"
}*/

/*variable "enable_versioning" {
  description = "Flag to enable versioning on the S3 Bucket"
  type        = bool
  default     = false
}*/
