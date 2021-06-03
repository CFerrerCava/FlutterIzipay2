import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function todo;
  final String text;
  const CustomButton({this.todo, this.text}) : super();

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontFamily: 'Nunito', fontSize: 20.0);
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xFFEF4F4F),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: todo,
        child: Text(text,
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontFamily: 'Nunito',
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
