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

variable "ecr_repo_orders_name" {
  description = "Repositorio ECR para imagen orders"
  type        = string
  default     = "orders"
}

variable "ecr_repo_payments_name" {
  description = "Repositorio ECR para imagen payments"
  type        = string
  default     = "payments"
}

variable "ecr_repo_products_name" {
  description = "Repositorio ECR para imagen products"
  type        = string
  default     = "products"
}

variable "ecr_repo_shipping_name" {
  description = "Repositorio ECR para imagen shipping"
  type        = string
  default     = "shipping"
}

