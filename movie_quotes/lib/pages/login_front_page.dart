import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_quotes/components/login_button_component.dart';
import 'package:movie_quotes/pages/email_password_auth_page.dart';

class LoginFrontPage extends StatefulWidget {
  const LoginFrontPage({super.key});

  @override
  State<LoginFrontPage> createState() => _LoginFrontPageState();
}

class _LoginFrontPageState extends State<LoginFrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Movie Quotes",
                textScaleFactor: 5,
                style: TextStyle(
                  fontFamily: "cursive",
                  // fontStyle: FontFace("cursive", source),
                )),
          ),
          Center(
            child: LoginButtonComponent(
              callback: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const EmailPasswordAuthPage(
                        isNewUser: true,
                      );
                    },
                  ),
                );
              },
              buttonText: "Create an account",
            ),
          ),
          Center(
            child: LoginButtonComponent(
              callback: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const EmailPasswordAuthPage(
                        isNewUser: false,
                      );
                    },
                  ),
                );
              },
              buttonText: "Log In",
            ),
          ),
          Center(
            child: LoginButtonComponent(
              callback: () {},
              buttonText: "Google Facebook, etc.",
            ),
          )
        ],
      ),
    );
  }
}
