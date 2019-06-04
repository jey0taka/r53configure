resource "aws_iam_role" "codepipeline-role" {
    name = "r53configure-${var.resource-name}-codepipeline-role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codepipeline.amazonaws.com",
                "Service": "codebuild.amazonaws.com",
                "Service": "codecommit.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline-role-policy" {
    role = "${aws_iam_role.codepipeline-role.id}"
    policy = <<EOF
{
    "Statement": [
        {
            "Action": [
                "elasticbeanstalk:*",
                "ec2:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "cloudwatch:*",
                "codebuild:*",
                "codedeploy:*",
                "codecommit:*",
                "s3:*",
                "sns:*",
                "cloudformation:*",
                "lambda:*",
                "rds:*",
                "sqs:*",
                "ecs:*",
                "opsworks:*",
                "iam:PassRole"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ],
    "Version": "2012-10-17"
}
EOF
}