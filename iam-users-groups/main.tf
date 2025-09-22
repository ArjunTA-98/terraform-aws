provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

variable "user_names" {
  # Update the list as needed!
  default = ["Arjun", "Arun", "Bharti"]
}

resource "aws_iam_group" "ec2_admins" {
  name = "EC2_Admins"
}

resource "aws_iam_policy" "ec2_full_access" {
  name        = "EC2_Full_Access"
  description = "Full access to EC2 for group members"
  policy      = data.aws_iam_policy_document.ec2_full_access.json
}

data "aws_iam_policy_document" "ec2_full_access" {
  statement {
    actions   = ["ec2:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_group_policy_attachment" "attach_policy" {
  group      = aws_iam_group.ec2_admins.name
  policy_arn = aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_user" "users" {
  for_each = toset(var.user_names)
  name     = each.key

  tags = {
    Name = each.key
    Project = "TF-AWS-Automation"
  }
}

resource "aws_iam_user_group_membership" "group_membership" {
  for_each = toset(var.user_names)
  user     = aws_iam_user.users[each.key].name
  groups   = [aws_iam_group.ec2_admins.name]
}