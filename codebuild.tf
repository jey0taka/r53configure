resource "aws_codebuild_project" "codebuild-project" {
  name         = "r53configure-${var.resource-name}-codebuild"
  build_timeout      = "10"
  service_role = "${aws_iam_role.codebuild-role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type     = "NO_CACHE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "CODECOMMIT"
    location        = "${var.codecommit_url}"
    git_clone_depth = 1
  }
}