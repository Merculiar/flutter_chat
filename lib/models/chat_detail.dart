class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.isSender,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "Hello",
    isSender: false,
  ),
  ChatMessage(
    text: "Hello",
    isSender: true,
  ),
  ChatMessage(
    text: "Hello",
    isSender: false,
  ),
  ChatMessage(
    text: "Hello",
    isSender: true,
  ),
  ChatMessage(
    text: "Hello",
    isSender: true,
  ),
  ChatMessage(
    text: "Hello",
    isSender: false,
  ),
  ChatMessage(
    text: "Hello",
    isSender: true,
  ),
];
