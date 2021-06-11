import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/style/custom_colors.dart';
import 'package:flutter_chat/utils/authentication.dart';
import 'package:flutter_chat/widgets/google_sign_in_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _url = 'https://flutter.dev';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.baseGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/logos/chat_logo.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'MyChat',
                      style: TextStyle(
                        color: CustomColors.grey,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.baseOrange,
                    ),
                  );
                },
              ),
              new RichText(
                  text: new TextSpan(children: [
                new TextSpan(
                  text: 'See ',
                  style: new TextStyle(color: CustomColors.grey),
                ),
                new TextSpan(
                    text: 'Terms and Conditions',
                    style: new TextStyle(color: CustomColors.baseAmber),
                    recognizer: new TapGestureRecognizer()
                      ..onTap =  ()  {
                        launch(_url);
                      })
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
