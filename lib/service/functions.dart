import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Functions {
  static const int timeToSlide = 400;
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  static String regExFun(int type) {
    switch (type) {
      case 0:
        return r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
      default:
        return "-";
    }
  }

  static void navigatorTransition({
    BuildContext context,
    Widget screen,
    Curve curve,
    int milliseconds,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: milliseconds),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          animation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          return ScaleTransition(
            scale: animation,
            child: child,
            alignment: Alignment.center,
          );
        },
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
        ) {
          return screen;
        },
      ),
    );
  }

  static bool validate(String data, int regEx) {
    return !data.contains(new RegExp(regExFun(regEx)));
  }

  static animationRoute(BuildContext context, Widget widget,
      [Function refresh]) {
    refresh = refresh ?? (_) {};
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          );
          return ScaleTransition(
            scale: animation,
            child: child,
            alignment: Alignment.center,
          );
        },
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
        ) {
          return widget;
        },
      ),
    ).then((value) => refresh(value));
  }
}
