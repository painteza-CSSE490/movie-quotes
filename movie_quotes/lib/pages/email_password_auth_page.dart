import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class EmailPasswordAuthPage extends StatefulWidget {
  final bool isNewUser;
  const EmailPasswordAuthPage({required this.isNewUser, super.key});
  @override
  State<EmailPasswordAuthPage> createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends State<EmailPasswordAuthPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(widget.isNewUser ? "Create an Account" : "Log In"))),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4.0),
            child: TextFormField(
              controller: emailTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || !EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4.0),
            child: TextFormField(
              controller: passwordTextController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Passwords mus be at least 6 characters',
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Passwords mus be at least 6 characters';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process Data
                    if (widget.isNewUser) {
                      print("Create New User");
                    } else {
                      print("Login");
                    }
                  }
                },
                child: Text(widget.isNewUser ? "Create New Account" : "Login")),
          )
        ]),
      ),
    );
  }
}
