import 'package:flutter/material.dart';
import 'package:notify_with_google/model/cardModel.dart';
import 'package:notify_with_google/ui/components/field/FieldCustom.dart';

class FormCheckout extends StatefulWidget {
  final CardModel card;
  const FormCheckout({this.card}) : super();

  @override
  _FormCheckoutState createState() => _FormCheckoutState();
}

class _FormCheckoutState extends State<FormCheckout> {
  String monthYear = '';
  bool delete = false;
  @override
  Widget build(BuildContext context) {
    final node = FocusNode();
    return Container(
      child: Column(
        children: [
          FieldCustom(
            //labeTextColor: color,
            data: widget.card.numCard,
            focusNode: node,
            top: 5,
            labelText: "Número de tarjeta",
            maxLength: 16,
            keyboardType: TextInputType.number,
            hint: "Ingresar número de tarjeta",
            callback: (_) {
              setState(() {
                widget.card.numCard = _;
                if (widget.card.numCard.length == 16 &&
                    widget.card.numCard != null)
                  FocusScope.of(context).requestFocus(node);
              });
            },
            icon: Icons.payment_outlined,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FieldCustom(
                focusNode: node,
                width: 0.4,
                data: widget.card.month,
                top: 0,
                labelText: "Mes",
                maxLength: 2,
                keyboardType: TextInputType.number,
                hint: "MM",
                callback: (String _) {
                  print(_);
                  setState(() {
                    widget.card.month = _;
                    if (widget.card.month.length == 2) node.nextFocus();
                  });
                },
                icon: Icons.date_range_outlined,
              ),
              FieldCustom(
                width: 0.4,
                data: widget.card.year,
                top: 0,
                labelText: "Año",
                maxLength: 2,
                keyboardType: TextInputType.number,
                hint: "YY",
                callback: (String _) {
                  print(_);
                  setState(() {
                    widget.card.year = _;
                    if (widget.card.year.length == 2) node.nextFocus();
                  });
                },
                icon: Icons.date_range_outlined,
              ),
            ],
          ),
          FieldCustom(
            //labeTextColor: color,
            data: widget.card.cvv,
            top: 0,
            labelText: "CVV",
            maxLength: 4,
            keyboardType: TextInputType.number,
            hint: "Ingresar CVV",
            callback: (_) {
              setState(() {
                widget.card.cvv = _;
                if (widget.card.cvv.length == 4) node.nextFocus();
              });
            },
            icon: Icons.vpn_key_outlined,
          ),
          FieldCustom(
            //labeTextColor: color,
            data: widget.card.email,
            top: 0,
            labelText: "Email",
            maxLength: 50,
            keyboardType: TextInputType.emailAddress,
            hint: "Ingresar Email",
            callback: (_) {
              setState(() {});
              widget.card.email = _;
            },
            icon: Icons.email_outlined,
          ),
        ],
      ),
    );
  }
}
