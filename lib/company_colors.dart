
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CompanyColors {
  // CompanyColors._(); // this basically makes it so you can instantiate this class

  static final Color _blackPrimaryValue = Color.fromRGBO(0, 0, 0, 60);
  static MaterialColor black = generateMaterialColor(_blackPrimaryValue);
  static Color red = hexToColor("#BB0000");
  // static const MaterialColor black = const MaterialColor(
  //   _blackPrimaryValue,
  //   const <int, Color>{
  //     50: const Color(0xFFe0e0e0),
  //     100: const Color(0xFFb3b3b3),
  //     200: const Color(0xFF808080),
  //     300: const Color(0xFF4d4d4d),
  //     400: const Color(0xFF262626),
  //     500: const Color(_blackPrimaryValue),
  //     600: const Color(0xFF000000),
  //     700: const Color(0xFF000000),
  //     800: const Color(0xFF000000),
  //     900: const Color(0xFF000000),
  //   },
  // );
  // fromRGBO#000000

  static final Color _bluePrimaryValue = hexToColor("#003d7c") ;
  static MaterialColor blue = generateMaterialColor(_bluePrimaryValue);

  static final Color _yellowPrimaryValue = hexToColor("#ef7c00");
  static MaterialColor yellow = generateMaterialColor(_yellowPrimaryValue);
  static final Color skyBlue = hexToColor("#3277B2");
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) {
  return max(0, min((value + ((255 - value) * factor)).round(), 255));
}

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);