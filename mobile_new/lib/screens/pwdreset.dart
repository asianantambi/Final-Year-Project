// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_new/commons/helpers.dart';
import 'package:mobile_new/commons/text_style.dart' as utils;
import 'package:mobile_new/commons/app_constants.dart';
import 'package:mobile_new/screens/email_pwd_signin.dart';
import 'package:mobile_new/screens/email_pwd_signin.dart';

class ResetScreen extends StatefulWidget {
  ResetScreen(
      void Function(String name, String email, String password)
          fetchEmailPwdSignInData,
      void Function() goToResetScreen,
      String s);
  @override
  ResetScreenState createState() => ResetScreenState();
}

////////////////////////new//////////////////

class ResetScreenState extends State<ResetScreen> {
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String _email;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    //  setState(() {
    //     buttonText = "Login";
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: ('Email'),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text('Send Request'),
                onPressed: () {
                  firebaseAuth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                color: Theme.of(context).accentColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
