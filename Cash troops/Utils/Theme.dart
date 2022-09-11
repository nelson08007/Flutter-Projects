import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Colors.red;
  static final primaryColor = Colors.red.shade300;

  static final darkTheme = ThemeData(
    fontFamily: 'ubuntu',
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    //accentColor: Colors.blue,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    fontFamily: 'ubuntu',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}