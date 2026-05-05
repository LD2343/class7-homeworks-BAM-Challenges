# API Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api#endpoint_configuration-1

resource "aws_api_gateway_rest_api" "rest_api" {
  name        = "rest_api"
  description = "REST API - Regional"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# API Gateway Resources for Python & Node
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource

resource "aws_api_gateway_resource" "python_resource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = "python"
}

resource "aws_api_gateway_resource" "node_resource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = "node"
}

# API Gateway Methods for Python & Node
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method

resource "aws_api_gateway_method" "python_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.python_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "node_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.node_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# API Gateway Integrations for Python & Node
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration

resource "aws_api_gateway_integration" "python_integration" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  resource_id = aws_api_gateway_resource.python_resource.id
  http_method = aws_api_gateway_method.python_get_method.http_method

  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.python.invoke_arn
}

resource "aws_api_gateway_integration" "node_integration" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  resource_id = aws_api_gateway_resource.node_resource.id
  http_method = aws_api_gateway_method.node_get_method.http_method

  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.node.invoke_arn
}

# API Gateway Deployment for Python & Node
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment

resource "aws_api_gateway_deployment" "rest_api_deployment" {
  depends_on = [
    aws_api_gateway_integration.python_integration,
    aws_api_gateway_integration.node_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.rest_api.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.python_resource.id,
      aws_api_gateway_method.python_get_method.id,
      aws_api_gateway_integration.python_integration.id,
      aws_api_gateway_resource.node_resource.id,
      aws_api_gateway_method.node_get_method.id,
      aws_api_gateway_integration.node_integration.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# API Gateway Stage
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage

resource "aws_api_gateway_stage" "prod_stage" {
  deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  stage_name    = "prod"
}