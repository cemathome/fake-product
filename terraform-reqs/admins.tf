
resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_user" "emma" {
  name = "emma"
}

resource "aws_iam_user" "liam" {
  name = "liam"
}

resource "aws_iam_group_membership" "admins" {
  name = "admins"

  users = [
    aws_iam_user.emma.name,
    aws_iam_user.liam.name,
  ]

  group = aws_iam_group.admins.name
}

resource "aws_iam_group_policy_attachment" "admins" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
