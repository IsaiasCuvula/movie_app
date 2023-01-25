import 'package:flutter/material.dart';


Color kDarkGrey = const Color(0xFF242A32);

class MovieAppTheme{


  static ThemeData dark(){
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kDarkGrey,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: kDarkGrey
      )
    );
  }
}