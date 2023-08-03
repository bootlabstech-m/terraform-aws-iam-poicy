resource "aws_iam_policy" "iam_policy" {
  name        = var.policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.policy_action
        Effect   = var.policy_effect
        Resource = var.policy_resource
      },
    ]
  })
    lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_iam_policy_attachment" "attachment" {
  name       =   var.policy_attachment_name
  roles       = var.iam_roles
  policy_arn = aws_iam_policy.iam_policy.arn  
}