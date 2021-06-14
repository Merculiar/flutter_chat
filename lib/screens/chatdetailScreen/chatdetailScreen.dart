import 'package:flutter_chat/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/style/custom_colors.dart';


class ChatDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Text('Hello how are u?'),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.baseNavy,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user4.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vlad Vladenko",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active yesterday",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.local_phone), onPressed: () {}),
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
      ],
    );
  }
}