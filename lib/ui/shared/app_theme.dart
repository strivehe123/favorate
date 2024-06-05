import 'package:flutter/material.dart';
class AppTheme{
  static const double bodyFontSize=14;
  static const double smallFontSize=16;
  static const double mediumFontSize=20;
  static const double largeFontSize=24;
  static const Color lightColor=Colors.blueGrey;
  static const Color darkColor=Colors.green;

  static final ThemeData lightTheme=ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor:lightColor),
    // canvasColor: const Color.fromRGBO(255, 254, 222, 1),

    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: bodyFontSize),
      titleLarge: TextStyle(fontSize: largeFontSize),
      titleMedium: TextStyle(fontSize: mediumFontSize),
      titleSmall: TextStyle(fontSize: smallFontSize),),
    useMaterial3: true,
  ) ;
  static final ThemeData darkTheme=ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor:darkColor),
    useMaterial3: true,
  );
}