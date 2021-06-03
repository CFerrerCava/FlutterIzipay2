import 'package:flutter/material.dart';
import 'package:notify_with_google/service/functions.dart';

class TypeItem extends StatelessWidget {
  final String name;
  final Function toDo;
  final bool selected;
  const TypeItem(this.name, this.toDo, this.selected) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      // ignore: deprecated_member_use
      child: FlatButton(
        color:
            selected ? Functions.getColorFromHex('FF5353') : Color(0x81D4D1D1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 17.0,
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: toDo,
      ),
    );
  }
}
