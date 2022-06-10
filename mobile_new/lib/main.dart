import 'package:flutter/material.dart';

import 'dart:io';

// import 'package:mobile_new/bloc/hotel_bloc.dart';
import 'package:mobile_new/commons/theme.dart';
// import 'package:mobile_new/ui/pages/hotel_search/home_page.dart';
import 'package:mobile_new/ui/utils/error_widget.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'main_controller.dart'; 




void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   if (kReleaseMode) exit(1);
  // };
  // ErrorWidget.builder = (FlutterErrorDetails details) => CustomErrorWidget();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking App',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'avenir',
        cardColor: Colors.white, colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch).copyWith(secondary: accentColor),
      ),
     
      initialRoute: "/",
      routes: {
        // "/": (context) => EmailPwdSignInScreen(),
        "/": (context) => MainController(),
        // HomeScreen.routeName: (context) => HomeScreen(_signUpData),
    
      },
      // home: ChangeNotifierProvider(
      //   create: (_) => HotelBloc()..retrieveHotels(),
      //   child: HotelSearchPage(),
      // ),
    );
  }
}
