import 'dart:async';
// import 'dart:html';

// import 'package:finder/tab_controller/home.dart';
// import 'package:mobile_new/commons/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_new/screens/SignUp.dart';

import 'package:mobile_new/screens/email_pwd_signin.dart';
import 'package:mobile_new/screens/pwdreset.dart';
import 'package:mobile_new/ui/pages/hotel_search/home_page.dart';
import 'bloc/hotel_bloc.dart';
// import 'data_access/chatDB.dart';
import 'data_access/chatData.dart';

import 'model/SignUpData.dart';

// import 'package:finder/home/home.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';

class MainController extends StatefulWidget {
  static const String routeName = "/main_controller";

  MainControllerState createState() => MainControllerState();
}

class MainControllerState extends State<MainController> {
  String _username = "";
  Widget currentPage;
  GoogleSignIn googleSignIn;
  Widget userPage;

  SignUpData _signUpData = new SignUpData();

  @override
  void initState() {
    super.initState();
    _goToEmailPwdSignIn();
    // init("Just Chat",context);
  }

  // void _goToSignInScreen() async {
  //     setState(() {
  //       userPage = SignInHome(
  //     onSignin: () {
  //       _openBottomSheet(context);
  //       print("Sign");
  //     },
  //     onSigninWithGoogle: () {
  //       _signin();
  //       print("Sign");
  //     },
  //     onGetStarted: () {
  //       _getStarted();
  //       print("Sign");
  //     },
  //     // onLogout: _logout,
  //     showLoading: false,
  //     onSignInInHomeBackPress: _onSignInInHomeBackPress,
  //   );
  //     });

  // }

  void _goToEmailPwdSignIn() async {
    setState(() {
      userPage = EmailPwdSignInScreen(
          _fetchEmailPwdSignInData, _goToEmailPwdSignUp, "Login");
    });
  }

  void _goToEmailPwdSignUp() async {
    setState(() {
      userPage = EmailPwdSignUpScreen(
          _fetchEmailPwdSignUpData, _goToEmailPwdSignIn, "Sign Up");
    });
  }

  void _fetchEmailPwdSignUpData(
      String email, String password, String name) async {
    _signUpData.name = name;
    _signUpData.email = email;
    _signUpData.password = password;

    _registerWithEmail(_signUpData);

    ///UNCOMMNENT THIS DIRECT TO TEST NAVIGATION TO THE HOTELS///

    // _goToTabControllerHome(_signUpData);
  }

  //  void init(String applicationName, BuildContext context) {
  //   appName = applicationName;
  //   //startTime(context);
  //   checkUserLogin(context);
  // }

  void checkUserLogin(BuildContext context) async {
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

      _signUpData.uID = logInUser.uid;
      _signUpData.name = logInUser.displayName;
      _signUpData.email = logInUser.email;

      _goToTabControllerHome(_signUpData);
    } else {
      _goToEmailPwdSignIn();
    }
  }

  static Future<bool> isSignedIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    bool isLoggedIn = await googleSignIn.isSignedIn();
    return isLoggedIn;
  }

  Future<User> _registerWithEmail(SignUpData userData) async {
    try {
      User registeredUser =
          await ChatData.registerWithEmailAndPassword(userData);

      if (registeredUser != null) {
        print(registeredUser.uid);
        print(registeredUser.email);

        _goToTabControllerHome(_signUpData);
        print('sign in signin');
        //ChatData.checkUserLogin(context);
      } else {
        //print('sign in fail');
        Fluttertoast.showToast(msg: "Sign Up Failed");

        // Navigator.of(key.currentContext,rootNavigator: true).pop();//close the dialoge

      }
      return null;
    } catch (ex) {
      Fluttertoast.showToast(msg: ex.toString());
      print(ex.toString());
    }
  }

  Future<User> _signInWithEmailAndPassword(SignUpData userData) async {
    User registeredUser = await ChatData.signInWithEmailAndPassword(userData);

    if (registeredUser != null) {
      print(registeredUser.uid);
      print(registeredUser.email);

      //  print(password);
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(registeredUser.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            _signUpData.name = documentSnapshot.get('name');
            _signUpData.uID = documentSnapshot.get('userId');

            print(_signUpData.name);
            print(_signUpData.uID);
          } else {
            print("Mising user data");
          }
        });
      } catch (ex) {}

      _goToTabControllerHome(_signUpData);

      print('sign in signin');
    } else {
      _goToEmailPwdSignIn();

      Fluttertoast.showToast(msg: "Wrong Username Or Password");
    }

    return null;
  }

  // Future<bool> _onNameStepBackPress() async {
  //    _goToSignUpScreen();
  //   return false;
  // }

// CALL THIS TO ROUTE TO HOTELS SCREEN/////////////////////////
  void _goToTabControllerHome(SignUpData signUpData) async {
    setState(() {
      userPage = ChangeNotifierProvider(
        create: (_) => HotelBloc()..retrieveHotels(),
        child: HotelSearchPage(),
      );
      //     TabControllerHome(
      //   signUpData,
      // _logout
      // );
    });
  }

  void _fetchEmailPwdSignInData(String email, String password) {
    // print(dt);

    print(email);
    print(password);
    print(_signUpData.name);

    _signUpData.email = email;
    _signUpData.password = password;

    _signInWithEmailAndPassword(_signUpData);

//UNCOMMENT THIS TO TEST NAVIGATION TO THE HOTELS DIRECT//
    //_goToTabControllerHome(_signUpData);
  }

  void _logout(BuildContext context) async {
    await ChatData.handleSignOut(context);

    _goToEmailPwdSignIn();
  }

//////////////////new for reset password////////////////////
  void _fetchsendPwdResetEmail(String email) {
    // print(dt);

    print(email);
    // print(_signUpData.name);

    _signUpData.email = email;

    _signInWithEmailAndPassword(_signUpData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: userPage,
    );
  }
}
