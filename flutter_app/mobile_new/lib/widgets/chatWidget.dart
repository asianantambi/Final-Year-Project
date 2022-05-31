// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../data_access/chatDB.dart';
import '../data_access/chatData.dart';
import 'package:mobile_new/commons/app_constants.dart';
// import 'package:mobile_new/modules/chat_module/screens/chat.dart';
// import 'package:finder/modules/chat_module/screens/zoomImage.dart';


class HotelWidgets {
  static getFriendList() {
    List<String> data = [
      "h7127ZCne0OzSRwNXtktMPei0CH3",
      "pdj9dlfEQMTUD6s954qiPeplEog2"
    ];
    return data;
  }
  static Widget getAppBar() {
    return AppBar(
      leading: null,
      title: Text(ChatData.appName),
      backgroundColor: themeColor,
    );
  }

  static Widget widgetWelcomeScreen(BuildContext context) {
    return Center(
      child: Container(
          child: Text(
        ChatData.appName,
        style: TextStyle(fontSize: 28),
      )),
    );
  }

  static Widget widgetShowText(
      String text, dynamic textSize, dynamic textColor) {
    return Text(
      '$text',
      style: TextStyle(
          color: (textColor == '') ? Colors.white70 : textColor,
          fontSize: textSize == '' ? 14.0 : textSize),
    );
  }
}
