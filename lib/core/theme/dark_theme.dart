import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    fontFamily: 'SSP',
    colorScheme: ColorScheme.dark(
      primary: secondaryColorDark,
      secondary: secondaryColorDark,
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: secondaryColorDark),
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
            color: Colors.white,
            fontWeight: FontWeight.w800
        ),
        headline3: TextStyle(
          color: primaryColorDark,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColorDark),
    )));
