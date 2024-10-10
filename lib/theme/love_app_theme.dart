import 'package:flutter/material.dart';

class LoveAppTheme {
  static ThemeData miratrixLightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(28, 23, 30, 100),
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 36,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.black,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
  static ThemeData montserratLightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(28, 23, 30, 100),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFC0B6C8),
        fontSize: 12,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFC0B6C8),
        fontSize: 12,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFC0B6C8),
        fontSize: 12,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
  static LoveAppTheme of(BuildContext context) {
    return LoveAppTheme();
  }
}
