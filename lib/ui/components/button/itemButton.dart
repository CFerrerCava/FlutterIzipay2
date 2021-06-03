import 'package:flutter/material.dart';
import 'package:notify_with_google/service/app_theme.dart';

class ItemButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function todo;
  final double fontSize;
  final List<double> padding;
  const ItemButton({
    this.icon,
    this.todo,
    this.text = '',
    this.fontSize = 11,
    this.padding,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        todo();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 0,
          right: 5,
          left: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              elevation: 2.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              child: Container(
                padding: (padding == null)
                    ? EdgeInsets.all(7)
                    : EdgeInsets.only(
                        left: padding[0],
                        top: padding[1],
                        right: padding[2],
                        bottom: padding[3],
                      ),
                child: icon,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppTheme.defect.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: AppTheme.allText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
