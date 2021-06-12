import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/chatsScreen/chatsScreen.dart';
import 'package:flutter_chat/screens/moreScreen.dart/moreScreen.dart';
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

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    List<Widget> pageList = <Widget>[
      ChatsScreen(user: widget._user),
      MoreScreen(),
      NotificationsScreen(),
    ];

    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
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
