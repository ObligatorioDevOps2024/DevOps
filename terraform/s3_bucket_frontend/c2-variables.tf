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
  description = "Repositorio ECR para imagenes"
  type        = string
  default     = "frontend-docker-images"
}
