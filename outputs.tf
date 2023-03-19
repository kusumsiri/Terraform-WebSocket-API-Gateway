output "api-id" {
  value = aws_apigatewayv2_api.chat.id
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.chat.api_endpoint
}

output "lambda_function_arn" {
  value = module.lambda_function.lambda_function_arn
}