output "invoke_node_url" {
  value = "${aws_api_gateway_stage.prod_stage.invoke_url}${local.nodeQuery}"
}

output "invoke_python_url" {
  value = "${aws_api_gateway_stage.prod_stage.invoke_url}${local.pythonQuery}"
}