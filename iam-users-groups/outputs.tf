output "iam_users" {
  value = [for uname, user in aws_iam_user.users : user.name]
}

output "iam_group_name" {
  value = aws_iam_group.ec2_admins.name
}