import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
    scaffoldBackgroundColor: Colors.grey[50],
    textTheme: TextTheme(
        bodyMedium: TextStyle(
            color: Colors.grey[400], fontSize: 18, fontWeight: FontWeight.w300),
        bodyLarge: const TextStyle(
            color: Colors.black, fontSize: 28, fontWeight: FontWeight.w900)));
