import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/chatsScreen/chatsScreen.dart';
import 'package:flutter_chat/screens/moreScreen/moreScreen.dart';
import 'package:flutter_chat/screens/notificationsScreen/notificationsScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screenList = <Widget>[
      ChatsScreen(user: widget._user),
      MoreScreen(),
      NotificationsScreen(),
    ];

    return Scaffold(
      body: screenList[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        onTap: (value) {
          setState(() {
            screenIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
        ],
      ),
    );
  }
}
