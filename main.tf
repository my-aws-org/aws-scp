provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_organizations_policy" "scp-leave-org" {
  name = "scp-leave-org"
  description = "This SCP prevents users or roles in any affected account from leaving AWS Organizations, either directly as a command or through the console. "
  content = file("polices/scp-leave-org.json")
}

resource "aws_organizations_policy_attachment" "scp-leave-org_attachment" {
  policy_id = aws_organizations_policy.scp-leave-org.id
  target_id = var.target_id
}

resource "aws_organizations_policy" "scp-bill-pay-protect" {
  name = "scp-bill-pay-protect"
  description = "This SCP prevents users or roles in any affected account from modifying the account and billing settings, either directly as a command or through the console."
  content = file("polices/scp-bill-pay-protect.json")
 }

resource "aws_organizations_policy" "scp-iam-user-accesskey-disable" {
  name = "scp-iam-user-accesskey-disable"
  description = "This SCP restricts IAM principals from creating new IAM users or IAM Access Keys in an AWS account."
  content = file("polices/scp-iam-user-accesskey-disable.json")
}

resource "aws_organizations_policy" "scp-s3-public-access-block" {
  name = "scp-s3-public-access-block"
  description = "This SCP prevents users or roles in any affected account from modifying the S3 Block Public Access Settings in an Account."
  content = file("polices/scp-s3-public-access-block.json")
}
