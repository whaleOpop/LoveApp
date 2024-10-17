import 'package:flutter/material.dart';

class LoveAppTheme {
  static ThemeData miratrixLightTheme = ThemeData(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 36,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 24,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 20,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 14,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 12,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.black,
        fontSize: 16,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Miratrix',
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
  static ThemeData montserratLightTheme = ThemeData(
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFC0B6C8),
        fontSize: 12,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFC0B6C8),
        fontSize: 16,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFC0B6C8),
        fontSize: 10,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 10,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
  static LoveAppTheme of(BuildContext context) {
    return LoveAppTheme();
  }
}
