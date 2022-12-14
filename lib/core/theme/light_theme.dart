import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  fontFamily: 'SSP',
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primaryColor.withOpacity(0.5),
    selectionColor: Colors.blueAccent.withOpacity(0.5),
    selectionHandleColor: primaryColor,
  ),
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
      headline5: TextStyle(
        color: primaryColor,
        fontSize: 29.0,
        fontWeight: FontWeight.w800,
      ),
      headline6: TextStyle(
        fontSize: 27.0,
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
      ),
      subtitle2: TextStyle(
        fontSize: 15.0,
        color:  Colors.black,
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.only(top: 10.0, bottom: 10.0)),
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
  )),
);
