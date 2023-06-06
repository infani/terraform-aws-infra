//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project
resource "aws_codebuild_project" "example" {
  name         = var.name
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_MEDIUM"
    image           = "aws/codebuild/standard:4.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "ENV_GIT_BRANCH"
      value = var.branch
    }

  }

  source {
    type            = "GITHUB"
    location        = var.gitLocation
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

}

resource "aws_codebuild_webhook" "example" {
  project_name = aws_codebuild_project.example.name
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }

    filter {
      type    = "HEAD_REF"
      pattern = "main"
    }
  }
}

resource "aws_iam_role" "codebuild_role" {
  name               = "${var.name}-codebuild-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
