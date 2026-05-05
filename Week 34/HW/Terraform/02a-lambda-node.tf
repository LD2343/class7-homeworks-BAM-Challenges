# Lambda - Nodejs
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function

resource "aws_lambda_function" "node" {
  function_name = "node_lambda_tf"
  role          = aws_iam_role.lambda_role.arn
  handler       = "node-lambda.handler"
  runtime       = "nodejs18.x"
  code_sha256   = data.archive_file.zip_node_lambda.output_base64sha256

  filename = data.archive_file.zip_node_lambda.output_path
}

data "archive_file" "zip_node_lambda" {
  type        = "zip"
  source_file = "./src/node-lambda.js"
  output_path = "./lambda_builds/node-lambda.zip"
}

resource "aws_lambda_permission" "api_node" {
  statement_id  = "AllowAPIGatewayInvokeNode"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.node.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.rest_api.execution_arn}/*/*"
}