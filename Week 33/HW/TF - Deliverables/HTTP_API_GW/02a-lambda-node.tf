# Lambda - Nodejs
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function

resource "aws_lambda_function" "node" {
  function_name = "node_lambda_tf"
  role = aws_iam_role.lambda_role.arn
  handler = "index.handler"
  runtime = "nodejs18.x"

  filename = "nodejs_lambda_v2.zip"
}