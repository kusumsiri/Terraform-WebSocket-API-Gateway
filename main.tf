resource "aws_apigatewayv2_api" "chat" {
  name                          = "chat-websocket"
  protocol_type                 = "WEBSOCKET"
  route_selection_expression    = "$request.body.action"
  description                   = "API for chat application"
}

resource "aws_apigatewayv2_stage" "chat" {
  api_id = aws_apigatewayv2_api.chat.id
  name   = "dev"
  description = "Development stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_route" "chat" {
  api_id = aws_apigatewayv2_api.chat.id
  route_key = "$default"

}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "src"

  tags = {
    Name = "my-lambda1"
  }
}