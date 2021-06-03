import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify_with_google/service/functions.dart';

class AppTheme {
  AppTheme._();

  static Color allText = Functions.getColorFromHex('3B435F');
  //static const Color notWhite = Color(0xFFEDF0F2);
  //static const Color nearlyWhite = Color(0xFFFEFEFE);
  //static const Color white = Color(0xFFFFFFFF);
  //static const Color nearlyBlack = Color(0xFF213333);
  static const Color drawerBackground = Color(0xE3EE9052);
  //static const Color grey = Color(0xFF3A5160);
  //static const Color dark_grey = Color(0xFF313A44);

  // static const Color darkText = Color(0xFF253840);
  //static const Color darkerText = Color(0xFF17262A);
  //static const Color lightText = Color(0xFF4A6572);
  //static const Color deactivatedText = Color(0xFF767676);
  //static const Color dismissibleBackground = Color(0xFF364A54);
  //static const Color chipBackground = Color(0xFFEEF1F3);
  //static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Poppins';
  //static const Color background = Color(0xAD000000);
  //static const Color custom_caed_background = Color(0x7AFFEEEE);
  // static const Color custom_background = Color(0xFFF0F0F0);
  //
  //

  static TextStyle defect = TextStyle(
    fontFamily: fontName,
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: Functions.getColorFromHex('3B435F'),
  );
  static const TextStyle letter_normal = TextStyle(
    fontFamily: fontName,
    fontSize: 20.0,
    //color: Colors.white,
  );
  static const TextStyle letter_hint = TextStyle(
    fontFamily: fontName,
    fontSize: 20.0,
    //color: Colors.white,
  );
  static const TextStyle letter_selected = TextStyle(
    fontFamily: fontName, fontSize: 20.0, fontWeight: FontWeight.w600,
    //color: Colors.white,
  );
  static const TextStyle letter_Title = TextStyle(
    fontFamily: fontName,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    //color: Colors.white,
  );
  static const TextStyle letter_icon = TextStyle(
    fontFamily: fontName,
    fontSize: 15.0,
  );
  static const TextStyle letter_card = TextStyle(
    fontFamily: fontName,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    //color: Colors.white,
  );
  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: Colors.black,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: Colors.black,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 27,
    letterSpacing: 0.18,
    color: Colors.black,
  );
  static const TextStyle paymentTitle = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 35,
    letterSpacing: 0.18,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: Colors.black,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: Colors.black,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: Colors.black,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: Colors.black, // was lightText
  );
}
