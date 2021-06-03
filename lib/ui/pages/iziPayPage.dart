import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notify_with_google/model/cardModel.dart';
import 'package:notify_with_google/service/app_theme.dart';
import 'package:notify_with_google/ui/components/button/buttonLogin.dart';
import 'package:notify_with_google/ui/components/checkout/formCheckout.dart';

class IziPay extends StatefulWidget {
  IziPay({Key key}) : super(key: key);

  @override
  _IziPayState createState() => _IziPayState();
}

class _IziPayState extends State<IziPay> {
  static const platform = const MethodChannel('cip.flutter.dev/hi');
  String hello = "";
  CardModel cardModel = CardModel(
    numCard: '',
    cvv: '',
    year: '',
    month: '',
    email: '',
  );
  String jsonModel =
      "{\"amount\":180,\"currency\":\"PEN\",\"paymentForms\":[{\"paymentMethodType\":\"CARD\",\"pan\":\"4970100000000055\",\"expiryMonth\":\"11\",\"expiryYear\":\"21\",\"securityCode\":\"123\"}]}";

  @override
  void initState() {
    // NiubizController.secutiry()
    //     .then((value) => print(value))
    //     .catchError((onError) => print(onError));
    super.initState();
  }

  void sayHello() async {
    String batteryLevel;
    try {
      final String result =
          await platform.invokeMethod('hello', ' its me, DIO');
      batteryLevel = result;
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get: '${e.message}'.";
    }

    setState(() {
      hello = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FormCheckout(
                card: cardModel,
              ),
              ButtonLight(
                toDo: () {
                  sayHello();
                },
                text: 'Contacta con nativo',
                color: Colors.amber.shade300,
                radius: [10, 10, 10, 10],
              ),
              Text(
                hello,
                style: AppTheme.defect.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
