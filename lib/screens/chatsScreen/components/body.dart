import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chats.dart';
import 'package:flutter_chat/screens/chatdetailScreen/chatdetailScreen.dart';
import 'package:flutter_chat/style/constants.dart';
import 'package:flutter_chat/style/custom_colors.dart';

import 'chatcard.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller = new TextEditingController();
  late final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                kDefaultPadding, 8, kDefaultPadding, kDefaultPadding),
            child: Card(
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Search...', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: _searchResult.length != 0 || controller.text.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Divider(
                      thickness: 1,
                      color: CustomColors.grey,
                    ),
                  ),
                  itemCount: _searchResult.length,
                  itemBuilder: (context, index) => ChatCard(
                      chat: _searchResult[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailScreen(),
                          ))),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Divider(
                      thickness: 1,
                      color: CustomColors.grey,
                    ),
                  ),
                  itemCount: chatsData.length,
                  itemBuilder: (context, index) => ChatCard(
                      chat: chatsData[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailScreen(),
                          ))),
                ),
        ),
      ],
    );
  }

  List<Chat> _searchResult = [];

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (int i = 0; i < chatsData.length; i++) {
      if (chatsData[i].name.contains(text)) {
        _searchResult.add(chatsData[i]);
      }
    }
    setState(() {});
  }
}
