resource "aws_apigateway2_api" "chat" {
  name = "chat-websocket"
  protocol_type = "WEBSOCKET"
  route_selection_expression = "$request.body.action"
  description = "API for chat application"
}