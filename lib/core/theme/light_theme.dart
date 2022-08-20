import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  fontFamily: 'SSP',
  colorScheme: ColorScheme.light(
    primary: secondaryColor,
    secondary: secondaryColor,
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: secondaryColor),
  textTheme: TextTheme(
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyText1: TextStyle(
        color: primaryColor,
        fontSize: 15.0
      ),
      headline6: TextStyle(
        fontSize: 30.0,
        color: Colors.black,
        fontWeight: FontWeight.w800
      ),
      headline3: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.only(top: 10.0, bottom: 10.0)),
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
  )),
);
