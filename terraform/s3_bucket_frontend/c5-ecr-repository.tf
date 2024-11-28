# Create an Amazon Elastic Container Registry (ECR) Repository
resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.ecr_repo_name

  tags = {
    "Name"    = var.ecr_repo_name
    "Purpose" = "Repositorio de imagenes Docker"
  }
}
