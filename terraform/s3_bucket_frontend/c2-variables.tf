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

variable "ecr_repo_name" {
  description = "Nombre para repo ECR"
  type        = list(string)
  default     = ["orders", "payments", "products", "shipping"]
}

