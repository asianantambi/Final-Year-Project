import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_new/main_controller.dart';
import 'package:mobile_new/widgets/chatWidget.dart';
import 'package:provider/provider.dart';
import '../bloc/hotel_bloc.dart';
import '../screens/email_pwd_signin.dart';
import '../ui/pages/hotel_search/home_page.dart';
import 'chatDB.dart';
import 'package:mobile_new/commons/app_constants.dart';
// import 'package:mobile_new/modules/chat_module/screens/chat_welcome_screen.dart';
// import 'package:finder/modules/chat_module/screens/login_screen.dart';
import 'package:mobile_new/model/SignUpData.dart';

class ChatData {
  static String appName = "Just Chat ";

  static Future<Null> openDialog(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: themeColor,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    HotelWidgets.widgetShowText(
                        'Are you sure to exit app?', '', ''),
                  ],
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 0);
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.cancel,
                                color: themeColor,
                              ),
                              margin: EdgeInsets.only(right: 10.0),
                            ),
                            HotelWidgets.widgetShowText(
                                'Cancel', '', themeColor),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 1);
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.check_circle,
                                color: themeColor,
                              ),
                              margin: EdgeInsets.only(right: 10.0),
                            ),
                            HotelWidgets.widgetShowText('Yes', '', themeColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
        break;
    }
  }

  static goExit(BuildContext context, Function _logout) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Do you want to logout?'),
            actions: <Widget>[
              new TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(
                      false); // dismisses only the dialog and returns false
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  // handleSignOut(context);
                  _logout(context);
                  Navigator.of(context, rootNavigator: true).pop(false);
                },
                // onPressed:  () => handleSignOut(context),
                child: Text('Yes'),
              ),
            ],
          );
        });
  }

  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static handleSignOut(BuildContext context) async {
    try {
      // final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      // showLoadingDialog(context, _keyLoader);//invoking login

      await Firebase.initializeApp();
      // final GoogleSignIn googleSignIn = GoogleSignIn();

      await FirebaseAuth.instance.signOut();
      // await googleSignIn.disconnect();
      // await googleSignIn.signOut();

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));

      //  Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();//close the dialoge

      //  Navigator.of(context).pushNamed("/");

    } catch (error) {
      print(error);
    }
  }

  // static Future<Null> handleSignOut(BuildContext context) async {

  //   await Firebase.initializeApp();
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   await FirebaseAuth.instance.signOut();
  //   await googleSignIn.disconnect();
  //   await googleSignIn.signOut();

  //   // Navigator.pushReplacement(
  //   //     context, MaterialPageRoute(builder: (context) => LoginScreen()));

  //   //  Navigator.of(context).pushNamed("/");

  // }

  static Future<User> authUsersGoogle(BuildContext context) async {
    await Firebase.initializeApp();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential logInUser =
        await firebaseAuth.signInWithCredential(credential);

    if (logInUser != null) {
      // Check is already sign up
      await ChatDBFireStore.checkUserExists(firebaseAuth.currentUser);

      final User logInUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      /**
       * Make user online
       */
      // await ChatDBFireStore.makeUserOnline(logInUser);

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             ChatWelcomeScreen(currentUserId: logInUser.uid, signUpData: null)));
      return logInUser;
    } else {
      return null;
    }
  }

  static Future<User> registerWithEmailAndPassword(
      SignUpData signUpData) async {
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final User user = (await _auth.createUserWithEmailAndPassword(
      email: signUpData.email,
      password: signUpData.password,
    ))
        .user;
    // if (user != null) {

    if (user != null) {
      // Check is already sign up
      await ChatDBFireStore().checkEmailPwdUserExists(user, signUpData);

      final User logInUser = await signInWithEmailAndPassword(signUpData);

      /**
       * Make user online
       */
      // await ChatDBFireStore.makeUserOnline(logInUser);

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(-
      //         builder: (context) =>
      //             ChatWelcomeScreen(currentUserId: logInUser.uid, signUpData: null)));
      return logInUser;
    } else {
      return user;
    }

    // return user;
    // } else {
    //   return user;
    // }

    return null;
  }

// static Future<User> signInWithPhoneAndPassword(SignUpData signUpData) async {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
// try{
//   final User user = (await _auth.signInWithEmailAndPassword(
//     email: signUpData.phoneNumber,
//     password: signUpData.password,
//   )).user;

//   if (user != null) {
//     return user;
//   } else {
//     return user;
//   }

// }catch(ex){
// print(ex.toString());
// }

// }

  static Future<User> signInWithEmailAndPassword(SignUpData signUpData) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: signUpData.email,
        password: signUpData.password,
      ))
          .user;

      if (user != null) {
        return user;
      } else {
        return user;
      }
    } catch (ex) {
      print(ex.toString());
    }
  }

  static Future<bool> checkUserLoggedin(BuildContext context) async {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null)
      return true;
    else
      return false;
  }

  static Future<bool> isSignedIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    bool isLoggedIn = await googleSignIn.isSignedIn();
    return isLoggedIn;
  }

  static void authUser(BuildContext context) async {
    // bool isValidUser = await ChatData.authUsersGoogle(context);

    User logInUser = await ChatData.authUsersGoogle(context);

    //print('isValid' + isValidUser.toString());
    if (logInUser != null) {
      //if (await ChatData.isSignedIn()) {
      print('sign in signin');
      //ChatData.checkUserLogin(context);

    } else {
      //print('sign in fail');
      Fluttertoast.showToast(msg: "Sign in fail");
    }
  }

  static init(String applicationName, BuildContext context) {
    appName = applicationName;
    //startTime(context);
    checkUserLogin(context);
  }

  static checkUserLogin(BuildContext context) async {
    await Firebase.initializeApp();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if (await isSignedIn() == true) {
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User logInUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (_) => HotelBloc()..retrieveHotels(),
                    child: HotelSearchPage(),
                  )));
      //ChatWelcomeScreen(currentUserId: logInUser.uid, signUpData: null,)));
    } else {
      //return ChatData.widgetLoginScreen(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainController()));
    }
  }

  static startTime(BuildContext context) async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, checkUserLogin(context));
  }
}
