import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff004c40),
        ),
        primaryColor: const Color(0xff63ffda),
      );
}
