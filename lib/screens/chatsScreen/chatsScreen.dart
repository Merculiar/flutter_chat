import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/style/custom_colors.dart';
import 'package:flutter_chat/screens/loginScreen/loginScreen.dart';
import 'package:flutter_chat/utils/authentication.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToLoginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: CustomColors.baseNavy,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _user.photoURL != null
              ? CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(_user.photoURL!),
                )
              : ClipOval(
                  child: Material(
                    color: CustomColors.baseGrey.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: CustomColors.baseGrey,
                      ),
                    ),
                  ),
                ),
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                'MyChat',
                style: TextStyle(
                  color: CustomColors.baseGrey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            child: _isSigningOut
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  )
                : IconButton(
                    icon: const Icon(Icons.logout_rounded),
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await Authentication.signOut(context: context);
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context)
                          .pushReplacement(_routeToLoginScreen());
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
