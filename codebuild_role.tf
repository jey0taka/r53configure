resource "aws_iam_role" "codebuild-role" {
  name = "r53configure-${var.resource-name}-codebuild-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codebuild-role-policy" {
  role        = "${aws_iam_role.codebuild-role.name}"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:*",
        "s3:*",
        "ec2:*",
        "route53:*",
        "codecommit:*"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}