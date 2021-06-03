import 'package:flutter/material.dart';
import 'package:notify_with_google/service/app_theme.dart';
import 'package:notify_with_google/service/functions.dart';

class SmallButton extends StatelessWidget {
  final int number;
  final Function toDo;
  final int isSelected;
  const SmallButton({
    this.number,
    this.toDo,
    this.isSelected,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE0E0E0),
            offset: const Offset(5.0, 5.0),
            blurRadius: 2.0,
            spreadRadius: -3.0,
          ),
        ],
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          toDo(number);
        },
        child: Text(
          "$number",
          style: AppTheme.defect.copyWith(
            color: (isSelected == number)
                ? Functions.getColorFromHex('FF5353')
                : AppTheme.allText,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
      margin: EdgeInsets.only(
        right: 5,
      ),
    );
  }
}
