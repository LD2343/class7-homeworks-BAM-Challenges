output "api_python_url" {
  value = "${aws_apigatewayv2_stage.prod.invoke_url}/python?name=Chewbacca"
}

output "api_node_url" {
  value = "${aws_apigatewayv2_stage.prod.invoke_url}/node?name=Malgus"
}