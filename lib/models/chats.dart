class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    required this.isActive,
  });
}

List chatsData = [
  Chat(
    name: "Michael Grant",
    lastMessage: "Thanks",
    image: "assets/images/user5.png",
    time: "Yesterday",
    isActive: true,
  ),
  Chat(
    name: "Darren Swiney",
    lastMessage: "Perhaps if the was some...",
    image: "assets/images/user2.png",
    time: "13:24",
    isActive: true,
  ),
  Chat(
    name: "Alexander Murphy",
    lastMessage: "Based on what you have told...",
    image: "assets/images/user3.png",
    time: "Mon",
    isActive: false,
  ),
  Chat(
    name: "Jacob Jones",
    lastMessage: "What time do you think you will be...",
    image: "assets/images/user4.png",
    time: "14:48",
    isActive: true,
  ),
  Chat(
    name: "Julie MacAndrew",
    lastMessage: "Thanks Julie",
    image: "assets/images/user5.png",
    time: "14:48",
    isActive: false,
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "How are you...",
    image: "assets/images/user1.png",
    time: "2d ago",
    isActive: false,
  ),
  Chat(
    name: "Mac Miller",
    lastMessage: "Hello Vlad! I hope you know me...",
    image: "assets/images/user2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "James Cameron",
    lastMessage: "English lessons...",
    image: "assets/images/user3.png",
    time: "5d ago",
    isActive: false,
  ),
];
