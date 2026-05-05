# Lambda - Python
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function

resource "aws_lambda_function" "python" {
  function_name = "python_lambda_tf"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.11"

  filename = "python_lambda_v2.zip"
}