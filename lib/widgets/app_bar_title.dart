import 'package:flutter/material.dart';
import 'package:flutter_chat/style/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/chat_logo.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'MyChat',
          style: TextStyle(
            color: CustomColors.baseYellow,
            fontSize: 18,
          ),
        ),
        Text(
          ' Authentication',
          style: TextStyle(
            color: CustomColors.baseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}