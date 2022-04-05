import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class ThemeManager {
  static ThemeData themeData = ThemeData(
    primaryColor: Colors.blue,
    backgroundColor: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(backgroundColor: kDetailColor),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(textStyle: TextButton.styleFrom().textStyle),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: kDetailColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: kDetailColor,
        textStyle: const TextStyle(
          color: kLightColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: kSecondaryTextColor,
      ),
      subtitle1: TextStyle(color: kSecondaryTextColor),
      button: TextStyle(color: kDetailColor),
      headline5: TextStyle(
        color: kTextColor,
      ),
      headline6: TextStyle(
        color: kSecondaryTextColor,
      ),
      bodyText1: TextStyle(
        color: kTextColor,
      ),
      bodyText2: TextStyle(
        color: kTextColor,
      ),
    ),
  );
}
