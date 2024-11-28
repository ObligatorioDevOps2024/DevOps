# Create an Amazon Elastic Container Registry (ECR) Repository
resource "aws_ecr_repository" "my_ecr_repo_orders" {
  name = var.ecr_repo_orders_name

  tags = {
    "Name"    = var.ecr_repo_orders_name
    "Purpose" = "Repositorio de imagenes Docker para orders"
  }
}

resource "aws_ecr_repository" "my_ecr_repo_payments" {
  name = var.ecr_repo_payments_name

  tags = {
    "Name"    = var.ecr_repo_payments_name
    "Purpose" = "Repositorio de imagenes Docker para payments"
  }
}

resource "aws_ecr_repository" "my_ecr_repo_products" {
  name = var.ecr_repo_products_name

  tags = {
    "Name"    = var.ecr_repo_products_name
    "Purpose" = "Repositorio de imagenes Docker para products"
  }
}

resource "aws_ecr_repository" "my_ecr_repo_shipping" {
  name = var.ecr_repo_shipping_name

  tags = {
    "Name"    = var.ecr_repo_shipping_name
    "Purpose" = "Repositorio de imagenes Docker para shipping"
  }
}
