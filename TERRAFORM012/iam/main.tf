provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = "devops"
}

resource "aws_iam_policy" "customPolicy" {
  name = "DevOpsPolicy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowSpecifics",
            "Action": [
                "lambda:*",
                "apigateway:*",
                "ec2:*",
                "rds:*",
                "s3:*",
                "sns:*",
                "states:*",
                "ssm:*",
                "sqs:*",
                "iam:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "cloudwatch:*",
                "cloudfront:*",
                "route53:*",
                "ecr:*",
                "logs:*",
                "ecs:*",
                "application-autoscaling:*",
                "logs:*",
                "events:*",
                "elasticache:*",
                "es:*",
                "kms:*",
                "dynamodb:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Sid": "DenySpecifics",
            "Action": [
                "iam:*User*",
                "iam:*Login*",
                "iam:*Group*",
                "iam:*Provider*",
                "aws-portal:*",
                "budgets:*",
                "config:*",
                "directconnect:*",
                "aws-marketplace:*",
                "aws-marketplace-management:*",
                "ec2:*ReservedInstances*"
            ],
            "Effect": "Deny",
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_policy_attachment" "test-attach" {
  name       = "attachment"
  users      = [aws_iam_user.user.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}