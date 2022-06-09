import 'package:flutter/material.dart';
import 'package:mobile_new/data_access/chatData.dart';
import 'package:mobile_new/commons/app_constants.dart';
import 'package:mobile_new/model/SignUpData.dart';


class AppBarWidgets {


  static Widget getSwipeAppBar(var dataLength, BuildContext context, Function _logout) {
    return AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white, //new Color.fromRGBO(106, 94, 175, 1.0),
          centerTitle: true,
          leading: new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Icon(
              Icons.equalizer,
              color: themeColor,
              size: 30.0,
            ),
          ),
          actions: <Widget>[
            new GestureDetector(
              onTap: () {

                  ChatData.goExit(context, _logout);
                //  _logout();

                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new PageMain()));
              },
              child: new Container(
                  margin: const EdgeInsets.all(15.0),
                  child: new Icon(
                    Icons.logout,
                    color: themeColor,
                    size: 30.0,
                  )),
            ),
          ],
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                 Image(image: AssetImage('assets/img/logo.png'), width: 80.0,height: 80.0,
      ),
              // new Text(
              //   "EVENTS",
              //   style: new TextStyle(
              //     color: Colors.purple,
              //       fontSize: 12.0,
              //       letterSpacing: 3.5,
              //       fontWeight: FontWeight.bold),
              // ),
              new Container(
                width: 15.0,
                height: 15.0,
                margin: new EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.center,
                child: new Text(
                  dataLength.toString(),
                  style: new TextStyle(fontSize: 10.0),
                ),
                decoration: new BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              )
            ],
          ),
        );
  }

   static Widget getLocationAppBar() {
    return AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white, //new Color.fromRGBO(106, 94, 175, 1.0),
          centerTitle: true,
          leading: new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Icon(
              Icons.equalizer,
              color: themeColor,
              size: 30.0,
            ),
          ),
          actions: <Widget>[
            new GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new PageMain()));
              },
              child: new Container(
                  margin: const EdgeInsets.all(15.0),
                  child: new Icon(
                    Icons.search,
                    color: themeColor,
                    size: 30.0,
                  )),
            ),
          ],
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Image(image: AssetImage('assets/images/logo.png'), width: 80.0,height: 80.0,),
              // new Text(
              //   "EVENTS",
              //   style: new TextStyle(
              //       fontSize: 12.0,
              //       letterSpacing: 3.5,
              //       fontWeight: FontWeight.bold),
              // ),
              new Container(
                width: 15.0,
                height: 15.0,
                margin: new EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.center,
                child: new Text(
                  "8",
                  style: new TextStyle(fontSize: 10.0),
                ),
                decoration: new BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              )
            ],
          ),
        );
  }

  static Widget getAppBar(BuildContext context, String uname, Function _logout) {
    return AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white, //new Color.fromRGBO(106, 94, 175, 1.0),
          centerTitle: true,
          leading: new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Icon(
              Icons.settings,
              color: new Color.fromRGBO(106, 94, 175, 1.0),
              size: 30.0,
            ),
          ),
          actions: <Widget>[
            new GestureDetector(
              onTap: () {
                ChatData.goExit(context, _logout);

                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new PageMain()));
              },
              child: new Container(
                  margin: const EdgeInsets.all(15.0),
                  child: new Icon(
                    Icons.logout,
                    color: new Color.fromRGBO(106, 94, 175, 1.0),
                    size: 30.0,
                  )),
            ),
          ],
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Image(image: AssetImage('assets/img/logo.png'), width: 40.0,height: 40.0,),
              // new Text(
              //   "EVENTS",
              //   style: new TextStyle(
              //       fontSize: 12.0,
              //       letterSpacing: 3.5,
              //       fontWeight: FontWeight.bold),
              // ),
              new Container(
                width: 100.0,
                height: 15.0,
                margin: new EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.center,
                child: new Text(
                  "Welcome "+ uname,
                  style: new TextStyle(fontSize: 10.0, color: new Color.fromRGBO(106, 94, 175, 1.0),),
                ),
                // decoration: new BoxDecoration(
                //     color: Colors.red, shape: BoxShape.rectangle),
              )
            ],
          ),
        );
  }
 
}
