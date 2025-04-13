import 'package:flutter/material.dart';

class AppTextTheme {
  static final AppTextTheme instance = AppTextTheme._();

  AppTextTheme._();

  /// Title
  final TextStyle blackTitle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final TextStyle greyTitle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Color(0xFF9D9D9D),
  );

  final TextStyle greenTitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF23B05C),
  );

  final TextStyle selectedGreenTitle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Color(0xFF23B05C),
    decoration: TextDecoration.underline,
    decorationColor: Color(0xFF23B05C),
    decorationThickness: 2,
  );


  /// SubTitle
  final TextStyle blackSubTitle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );


  /// Body
  final TextStyle body = const TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );

  final TextStyle caption = const TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
}
