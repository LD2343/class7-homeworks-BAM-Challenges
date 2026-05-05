# Lambda - Python
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function

resource "aws_lambda_function" "python" {
  function_name = "python_lambda_tf"
  role          = aws_iam_role.lambda_role.arn
  handler       = "python-lambda.lambda_handler"
  runtime       = "python3.11"
  code_sha256   = data.archive_file.chewbacca_python_lambda.output_base64sha256

  filename = data.archive_file.chewbacca_python_lambda.output_path
}

data "archive_file" "chewbacca_python_lambda" {
  type        = "zip"
  source_file = "./src/python-lambda.py"
  output_path = "./lambda_builds/python.zip"
}

# API Gateway Lambda Permissions
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission

resource "aws_lambda_permission" "api_python" {
  statement_id  = "AllowAPIGatewayInvokePython"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.python.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.rest_api.execution_arn}/*/*"
}