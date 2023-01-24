import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginButtonComponent extends StatelessWidget {
  var callback;
  String buttonText;
  LoginButtonComponent(
      {super.key, required this.callback, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ElevatedButton(
        onPressed: () => callback(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonText,
            textScaleFactor: 1.5,
            style: TextStyle(color: Colors.blue[10]),
          ),
        ),
      ),
    );
  }
}
