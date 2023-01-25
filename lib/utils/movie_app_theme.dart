import 'package:flutter/material.dart';

Color kDarkGrey = const Color(0xFF242A32);
Color kGrey = const Color(0xFF3A3F47);

class MovieAppTheme {
  static ThemeData dark() {
    return ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kDarkGrey,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: kDarkGrey,
      ),
    );
  }
}
