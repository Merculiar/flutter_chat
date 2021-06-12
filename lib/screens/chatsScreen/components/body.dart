import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chats.dart';
import 'package:flutter_chat/style/constants.dart';
import 'package:flutter_chat/style/custom_colors.dart';

import 'chatcard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Divider(
                thickness: 1,
                color: CustomColors.grey,
              ),
            ),
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () {},
            ),
          ),
        ),
      ],
    );
  }
}


