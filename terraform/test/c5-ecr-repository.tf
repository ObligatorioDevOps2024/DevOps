# Create an Amazon Elastic Container Registry (ECR) Repository

resource "aws_ecr_repository" "my_ecr_repos" {
  for_each = toset(var.ecr_repo_name)

  name = each.value

  tags = {
    "Name"    = each.value
    "Purpose" = "Repositorio de imagenes Docker para ${each.value}"
  }
}

