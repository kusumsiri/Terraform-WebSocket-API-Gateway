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

  function_name = "Chat-API-Handler"
  description   = "Function to handle Chat wensocket api"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  source_path = "src"

  tags = {
    Name = "Chat-API-Handler"
  }
  attach_policy = true
  policy = "arn:aws:iam::847855290887:policy/lambda-apigateway-policy-Jan21-2023"
  layers = [
    "arn:aws:lambda:us-east-1:847855290887:layer:node_module_aws-sdk:2"
  ]
}