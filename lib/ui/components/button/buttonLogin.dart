import 'package:flutter/material.dart';

class ButtonLight extends StatelessWidget {
  final Function toDo;
  final String text;
  final List<double> radius;
  final Color color;
  final double top;
  const ButtonLight({
    this.toDo,
    this.text,
    this.radius,
    this.color,
    this.top = 0,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontFamily: 'Poppins', fontSize: 17.5);
    return Container(
      margin: EdgeInsets.only(top: top),
      child: Material(
        elevation: 2.5,
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
            style: style.copyWith(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
