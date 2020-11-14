import 'package:flutter/material.dart';

final ThemeData companyTheme = ThemeData(
  primarySwatch: CompanyColors.primary,
  primaryColor: CompanyColors.primary[500],
  primaryColorBrightness: Brightness.light,
  accentColor: CompanyColors.primary[1300],
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Lato',
);

final ThemeData companyDarkTheme = ThemeData(
  primarySwatch: CompanyColors.primary,
  primaryColor: CompanyColors.primary[500],
  primaryColorBrightness: Brightness.dark,
  accentColor: CompanyColors.primary[1300],
  scaffoldBackgroundColor: CompanyColors.primary[500],
  fontFamily: 'Lato',
);

class CompanyColors {
  CompanyColors._();

  static MaterialColor primary = const MaterialColor(
    0xFF38BA8C,
    <int, Color>{
      20: Color(0xFF171433),
      30: Color(0xFF171433),
      40: Color(0xFF171433),
      50: Color(0xFF191635),
      100: Color(0xFF24213e),
      200: Color(0xFF2a2742),
      300: Color(0xFF322f48),
      400: Color(0xFF39364d),
      500: Color(0xFF3C3950),
      600: Color(0xFF37455d),
      700: Color(0xFF32516B),
      800: Color(0xFF2E5B76),
      900: Color(0xFF296784),
      1000: Color(0xFF237796),
      1100: Color(0xFF1E83A4),
      1200: Color(0xFF159bbf),
      1300: Color(0xFF00d4ff),
    },
  );

  static MaterialColor accent = const MaterialColor(
    0xFF6E6E6E,
    <int, Color>{
      50: Color(0x806E6E6E),
      100: Color(0x996E6E6E),
      200: Color(0xB36E6E6E),
      300: Color(0xFF925900),
      400: Color(0xFFc88619),
      500: Color(0xFFFFB64D),
      600: Color(0xFFffe87d),
      700: Color(0xFFffffae),
      800: Color(0xFF6E6E6E),
      900: Color(0xFF6E6E6E),
    },
  );
}
