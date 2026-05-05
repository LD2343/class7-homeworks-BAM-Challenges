# API Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api

resource "aws_apigatewayv2_api" "http_api_gw" {
  name = "http_api_gw"
  protocol_type = "HTTP"
}

# Integrations
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration

resource "aws_apigatewayv2_integration" "python" {
  api_id = aws_apigatewayv2_api.http_api_gw.id
  integration_type = "AWS_PROXY"
  integration_uri = aws_lambda_function.python.invoke_arn
}

resource "aws_apigatewayv2_integration" "node" {
  api_id = aws_apigatewayv2_api.http_api_gw.id
  integration_type = "AWS_PROXY"
  integration_uri = aws_lambda_function.node.invoke_arn
}

# Routes
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route

resource "aws_apigatewayv2_route" "python" {
  api_id = aws_apigatewayv2_api.http_api_gw.id
  route_key = "GET /python"
  target = "integrations/${aws_apigatewayv2_integration.python.id}"
}

resource "aws_apigatewayv2_route" "node" {
  api_id = aws_apigatewayv2_api.http_api_gw.id
  route_key = "GET /node"
  target = "integrations/${aws_apigatewayv2_integration.node.id}"
}

# Stage

resource "aws_apigatewayv2_stage" "prod" {
  api_id = aws_apigatewayv2_api.http_api_gw.id
  name = "prod"
  auto_deploy = true
}

# Permissions
resource "aws_lambda_permission" "api_python" {
  statement_id = "AllowAPIGatewayInvokePython"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.python.function_name
  principal = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api_gw.execution_arn}/*/*"
}

resource "aws_lambda_permission" "api_node" {
  statement_id = "AllowAPIGatewayInvokeNode"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.node.function_name
  principal = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api_gw.execution_arn}/*/*"
}