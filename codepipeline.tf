resource "aws_codepipeline" "codepipeline" {
  name     = "r53configure-${var.resource-name}-codepipeline"
  role_arn = "${aws_iam_role.codepipeline-role.arn}"
  artifact_store {
    location = "${aws_s3_bucket.codepipeline_artifact_store.bucket}"
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source"]

      configuration {
        RepositoryName = "${var.codecommit_reponame}"
        BranchName     = "master"
      }
    }
  }

  stage {
    name = "Build"
    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts  = ["source"]
      configuration {
        ProjectName = "${aws_codebuild_project.codebuild-project.name}"
      }
    }
  }
}