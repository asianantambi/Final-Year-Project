import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  final String txref = "My_unique_transaction_reference_256";
  final String amount = "150,000";
  final String currency = FlutterwaveCurrency.UGX;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  beginPayment() async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        encryptionKey: "FLWSECK_TEST1a6f25ca4ad4",
        publicKey: "FLWPUBK_TEST-216b7142cc1ae028eb16d8175bdbbf62-X",
        currency: this.currency,
        amount: this.amount,
        email: "continentf@gmail.com",
        fullName: "Sports View Hotel",
        txRef: this.txref,
        isDebugMode: true,
        phoneNumber: "+256750581308",
        acceptCardPayment: true,
        acceptUSSDPayment: true,
        acceptAccountPayment: true,
        acceptFrancophoneMobileMoney: true,
        acceptGhanaPayment: false,
        acceptMpesaPayment: false,
        acceptRwandaMoneyPayment: true,
        acceptUgandaPayment: true,
        acceptZambiaPayment: true);

    try {
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        // user didn't complete the transaction.
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response);
        if (isSuccessful) {
          // provide value to customer
        } else {
          // check message
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data.processorResponse);
        }
      }
    } catch (error, stacktrace) {
      // handleError(error);
    }
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data.currency == this.currency &&
        response.data.amount == this.amount &&
        response.data.txRef == this.txref;
  }
}

class FlutterwaveCurrency {
  final String currency = FlutterwaveCurrency.UGX;

  static String UGX;
}
