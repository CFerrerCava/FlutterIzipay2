import 'package:flutter/material.dart';
import 'package:notify_with_google/service/app_theme.dart';

class ButtonAction extends StatelessWidget {
  final Function toDo;
  final String text;
  final List<double> radius;
  final Color color;
  final Color labelColor;
  const ButtonAction({
    this.toDo,
    this.text,
    this.radius,
    this.color,
    this.labelColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius[0]),
        topRight: Radius.circular(radius[1]),
        bottomRight: Radius.circular(radius[2]),
        bottomLeft: Radius.circular(radius[3]),
      ),
      color: color ?? Color(0xFFDF3D3D),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          toDo();
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTheme.defect.copyWith(
            color: labelColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
