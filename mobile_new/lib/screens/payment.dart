import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();

  void _PaymentWidget() {}
}

class _MakePaymentState extends State<MakePayment> {
  // // flutterwave
  // final String txref = "My_unique_transaction_reference_256";
  //     final String amount = "150,000";
  //     final String currency = FlutterwaveCurrency.UGX;
  //     // DONE

  @override
  Widget build(BuildContext context) {
    Body:
    Center(
      child: Material(
          color: Colors.blue,
          elevation: 8,
          borderRadius: BorderRadius.circular(28),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(onTap: () {
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: AssetImage('assets/img/mtn.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6),
                Text(
                  'Make Payment',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                  // SizedBox(height: 6,),
                ),
              ],
            );
          })),
    );
  }

  @override
  Widget airtel(BuildContext context) {
    Body:
    Center(
      child: Material(
          color: Colors.blue,
          elevation: 8,
          borderRadius: BorderRadius.circular(28),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(onTap: () {
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: AssetImage('assets/img/airtel.jpg'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6),
                Text(
                  'Make Payment',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                  // SizedBox(height: 6,),
                ),
              ],
            );
            onPressed:
            () {
              widget._PaymentWidget();
            };
          })),
    );
  }
}
