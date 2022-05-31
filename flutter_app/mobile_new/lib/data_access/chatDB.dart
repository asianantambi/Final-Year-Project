import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_new/model/SignUpData.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter_native_image/flutter_native_image.dart';
import 'dart:io';
// import 'package:image_picker/image_picker.dart';


class ChatDBFireStore {
  static Future<bool> isUserSignedIn() async {
    // GoogleSignInAccount? user = _currentUser;

    return false;
  }

  static String getDocName() {
    String dbUser = "users";
    return dbUser;
  }

  void setUserLastSeen(User logInUser) async {
    if (logInUser != null)
      await FirebaseFirestore.instance
          .collection(getDocName())
          .doc(logInUser.uid)
          .set({
        'lastActive': DateTime.now().millisecondsSinceEpoch,
        'online': 'online'
      }, SetOptions(merge: true));
  }

  void setChatLastSeen(
      var currentUserId, var stCollection, var chatId, bool isChat) async {
    //if (logInUser != null) {
    await FirebaseFirestore.instance.collection(stCollection).doc(chatId).set(
        {currentUserId: isChat ? true : DateTime.now().millisecondsSinceEpoch},
        SetOptions(merge: true));
    //}
  }

  static Future<void> checkUserExists(User logInUser) async {
    //print('abcdearlier');
    QuerySnapshot result;
    try {
      result = await FirebaseFirestore.instance
          .collection(getDocName())
          .where('userId', isEqualTo: logInUser.uid)
          .get();
    } catch (e) {
      print('ERROR-- ' + e.toString());
    }

    //print('abcdeafter');
    final List<DocumentSnapshot> documents = result.docs;
    //print('abcdeafterfinal');
    if (documents.length == 0) {
      // Update data to server if new user
      await saveNewUser(logInUser);
    }
  }

  static saveNewUser(User logInUser) {
   
    List<String> friendList = [];
    List<String> photoList = [];

    FirebaseFirestore.instance.collection(getDocName()).doc(logInUser.uid).set({
      'nickname': logInUser.displayName,
      'photoUrl': logInUser.photoURL,
      'userId': logInUser.uid,
      'email': logInUser.email,
      'friends': friendList,
      'photos': photoList,
      'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      'chattingWith': null,
      'online': null
    });
  }

   Future<void> checkEmailPwdUserExists(User logInUser, SignUpData signUpData) async {
    //print('abcdearlier');
    QuerySnapshot result;
    try {
      result = await FirebaseFirestore.instance
          .collection(getDocName())
          .where('userId', isEqualTo: logInUser.uid)
          .get();
    } catch (e) {
      print('ERROR-- ' + e.toString());
    }

    final List<DocumentSnapshot> documents = result.docs;
  
    if (documents.length == 0) {
           await uploadFile(logInUser, signUpData);
    }
  }

  Future<String> uploadFile(User logInUser, SignUpData signUpData) async {
    String imageUrl;
    List<String> friendList = [];
    List<String> photoList = [];

    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference reference =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);
 

    try {
     
        FirebaseFirestore.instance.collection(getDocName()).doc(logInUser.uid).set({
      'password': signUpData.password,
      'email': signUpData.email,
      'name': signUpData.name,
      
    });
        
      return "success";
    } catch (e) {
      print('ERROR-- UPLOADING IFO ' + e.toString());
    }

      return "success";
  }

}
