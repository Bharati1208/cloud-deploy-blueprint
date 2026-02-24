provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "hello_repo" {
  name = "bharati-hello-repo"
}

output "repo_url" {
  value = aws_ecr_repository.hello_repo.repository_url
}