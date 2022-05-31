import 'package:flutter/material.dart';
import 'package:mobile_new/commons/helpers.dart';
import 'package:mobile_new/commons/text_style.dart' as utils;
import 'package:mobile_new/commons/app_constants.dart';

 
class EmailPwdSignUpScreen extends StatefulWidget {
   final Function _fetchEmailPwdSignUpData;
   final Function _goToEmailPwdSignIn; 
   String buttonText;

  EmailPwdSignUpScreen(this._fetchEmailPwdSignUpData, this._goToEmailPwdSignIn, this.buttonText);

  @override
  EmailPwdSignUpScreenState createState() => EmailPwdSignUpScreenState();
}

class EmailPwdSignUpScreenState extends State<EmailPwdSignUpScreen> {

    final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  // var buttonText = 'Login';

   void initState() {
    super.initState();
    //  setState(() {
    //     buttonText = "Login";
    //     });
     
  }

  void _submitData() {
    if (_emailController.text == ""|| _passwordController.text == "" || _nameController.text == "" ) {
      return;
    }
    // final enteredTitle = _genderController.text;
     setState(() {
        widget.buttonText = "Loading...";
        });

    widget._fetchEmailPwdSignUpData(_emailController.text, _passwordController.text, _nameController.text);

  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          child: signInBody(),
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
                // child:Icon(Icons.favorite, color: Colors.pink, size: 100.0,)
               ),

                    // child: Image.asset('asset/images/flutter-logo.png')),
          
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
               
                controller: _nameController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Name'),
              ),
            
            ],
          ),
        ),],)
                         
              
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
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
            FlatButton(
              onPressed: (){
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
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
                      Text('Already have an account?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          widget._goToEmailPwdSignIn();
                          //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                )),
            // Text('New User?' + 'Create Account', style: utils.getCustomFontTextStyle()),
          ],
        ),
        
      ),
    );}
}

ResetScreen() {
}

 




