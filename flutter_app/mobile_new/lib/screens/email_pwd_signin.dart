import 'package:flutter/material.dart';
import 'package:mobile_new/commons/helpers.dart';
import 'package:mobile_new/commons/text_style.dart' as utils;
import 'package:mobile_new/commons/app_constants.dart';
import 'package:mobile_new/screens/SignUp.dart';
import 'package:mobile_new/screens/SignUp.dart';

 
class EmailPwdSignInScreen extends StatefulWidget {
   final Function _fetchEmailPwdSignInData;
   final Function _getStarted; 
   final Function _onEmailPwdSignInBackPress;
   String buttonText;

  EmailPwdSignInScreen(this._fetchEmailPwdSignInData, this._getStarted, this._onEmailPwdSignInBackPress, this.buttonText);

  @override
  EmailPwdSignInScreenState createState() => EmailPwdSignInScreenState();
}

class EmailPwdSignInScreenState extends State<EmailPwdSignInScreen> {

    final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
  // var buttonText = 'Login';

   void initState() {
    super.initState();
    //  setState(() {
    //     buttonText = "Login";
    //     });
     
  }

  void _submitData() {
    if (_emailController.text == ""|| _passwordController.text == "" ) {
      return;
    }
    // final enteredTitle = _genderController.text;
     setState(() {
        widget.buttonText = "Loading...";
        });

    widget._fetchEmailPwdSignInData(_emailController.text, _passwordController.text);

  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          child: signInBody(),
          onWillPop: widget._onEmailPwdSignInBackPress,
        ),
    );
  }

   Widget signInBody() {

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Login Page"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70.0, bottom: 20.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    
               child: Image(image: AssetImage('assets/img/logo.png'), width: 200.0,height: 150,)
               ),

          
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [ Form(
          key: _formKey,
          child: Column(
            children: [
              
            TextFormField(
                validator: (value) => FormValidator.validateEmail(value),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            
            ],
          ),
        ),],)
             
              
              
            ),
           
            


// route to reset password screen/////////////////////////

          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              TextButton(child: Text('Forgot Password?'), onPressed:()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResetScreen())),)
            ]
          ),

            
             
            Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                  
                  this._submitData();

                },
                child: Text(
                  widget.buttonText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
               Container(
                  child: Row(
                    children: <Widget>[
                      Text('New User?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 20),
                        ),
                        // onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmailPwdSignUpScreen())),
                        )
                                        
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                )),
          ]
        ),
        
      ),
    );}

}

ResetScreen() {
}

 

//////////////////



