import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  // TODO: change logic
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final Map<int, Color> colorMap = {
      50: const Color.fromRGBO(201, 76, 76, 1),
      100: const Color(0xFFFCF6F6),
      200: const Color(0xFFFAEDED),
      300: const Color(0xFFF2D2D2),
      400: const Color(0xFFE9B7B7),
      500: const Color(0xFFD98282),
      600: const Color(0xFFC94C4C),
      700: const Color(0xFFB54444),
      800: const Color(0xFF792E2E),
      900: const Color(0xFF5A2222),
    };
    final MaterialColor swatch =
        MaterialColor(const Color.fromRGBO(201, 76, 76, 1).value, colorMap);
    return ThemeData(
      primarySwatch: swatch,
      primaryColor: isDarkTheme
          ? const Color.fromRGBO(55, 44, 54, 1) // primaryContainerColor
          : const Color.fromARGB(255, 205, 181, 173),
      scaffoldBackgroundColor: isDarkTheme
          ? const Color.fromRGBO(32, 21, 32, 1) // bg Color
          : const Color(0xFFE3DBD8),
      secondaryHeaderColor: isDarkTheme
          ? const Color(0xFFE9E8E9) //primaryBtnColor
          : const Color(0xFF2A211E),

      splashColor: isDarkTheme
          ? const Color.fromRGBO(201, 76, 76, 1)
          : const Color.fromARGB(255, 114, 49, 49), // primaryHeartColor
      cardColor: isDarkTheme //
          ? const Color(0xFF0E090E) // primaryAppBarColor
          : const Color(0xFF8D6E63),
      canvasColor: isDarkTheme
          ? const Color.fromRGBO(23, 16, 23, 1) //primaryInputColor
          : const Color(0xFFE3DBD8),
      hintColor: isDarkTheme
          ? const Color.fromRGBO(70, 61, 70, 1) //secondaryContainerColor
          : const Color(0xFF2A211E),

      highlightColor: isDarkTheme
          ? const Color(0xFF0A060A) //primaryIconsColor
          : const Color(0xFFAF9A92),

      disabledColor: Colors.grey,
      textTheme: Theme.of(context)
          .textTheme
          .merge(GoogleFonts.ptSerifTextTheme())
          .apply(
              bodyColor: ThemeData().secondaryHeaderColor, fontSizeFactor: 1.2),

      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
