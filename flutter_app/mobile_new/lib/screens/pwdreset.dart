import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_new/commons/helpers.dart';
import 'package:mobile_new/commons/text_style.dart' as utils;
import 'package:mobile_new/commons/app_constants.dart';
import 'package:mobile_new/screens/email_pwd_signin.dart';
import 'package:mobile_new/screens/email_pwd_signin.dart';


class ResetScreen extends StatefulWidget {
  final Function _fetchsendPwdResetEmail;
  final Function _goToEmailPwdSignIn; 
  String buttonText;

  ResetScreen(this._fetchsendPwdResetEmail, this._goToEmailPwdSignIn, this.buttonText);
  @override
  ResetScreenState createState() => ResetScreenState();
}


////////////////////////new//////////////////

class ResetScreenState extends State<ResetScreen> {
  final auth = FirebaseAuth.instanceFor;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String _email;
  final auth = FirebaseAuth.instanceFor;

  
  
   void initState() {
    super.initState();
    //  setState(() {
    //     buttonText = "Login";
    //     });
     
  }

  void _submitData() {
    if (_emailController.text == "" ) {
      return;
    }
    // final enteredTitle = _genderController.text;
     setState(() {
        widget.buttonText = "Loading...";
        });

    widget._fetchsendPwdResetEmail(_emailController.text);

  }

////////////////////end//////////////////////////



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
                    auth.sendPassworddResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).accentColor,
                )
              ],)
        ],
      ),
    );
  }
}