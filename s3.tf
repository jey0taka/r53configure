resource "aws_s3_bucket" "codepipeline_artifact_store" {
  bucket = "r53-${var.resource-name}-artifact-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
}