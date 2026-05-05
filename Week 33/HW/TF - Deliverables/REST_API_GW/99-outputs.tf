output "api_python_url" {
  value = "${aws_api_gateway_stage.prod_stage.invoke_url}/python?name=Chewbacca"
}

output "api_node_url" {
  value = "${aws_api_gateway_stage.prod_stage.invoke_url}/node?name=Malgus"
}