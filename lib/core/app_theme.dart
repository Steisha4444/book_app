// import 'package:book_app/core/theme_preference.dart';
// import 'package:book_app/core/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class AppColors {
//   final Color primaryBgColor;
//   final Color primaryBtnColor;
//   final Color primaryHeartColor;
//   final Color primaryStarColor;
//   final Color primaryAppBarColor;
//   final Color primaryInputColor;
//   final Color primaryContainerColor;
//   final Color secondaryContainerColor;
//   final Color primaryIconsColor;
//   final Color primaryTextColor;

//   AppColors({
//     required this.primaryBgColor,
//     required this.primaryBtnColor,
//     required this.primaryHeartColor,
//     required this.primaryStarColor,
//     required this.primaryAppBarColor,
//     required this.primaryInputColor,
//     required this.primaryContainerColor,
//     required this.secondaryContainerColor,
//     required this.primaryIconsColor,
//     required this.primaryTextColor,
//   });
// }

// class AppTheme {
//   static late bool isDarkTheme;

//   static final _darkColors = AppColors(
//     primaryBgColor: const Color.fromRGBO(32, 21, 32, 1),
//     primaryBtnColor: const Color.fromRGBO(239, 227, 200, 1),
//     primaryHeartColor: const Color.fromRGBO(201, 76, 76, 1),
//     primaryStarColor: const Color.fromRGBO(211, 166, 1, 1),
//     primaryAppBarColor: const Color.fromRGBO(112, 67, 65, 0.3),
//     primaryInputColor: const Color.fromRGBO(23, 16, 23, 1),
//     primaryContainerColor: const Color.fromRGBO(55, 44, 54, 1),
//     secondaryContainerColor: const Color.fromRGBO(70, 61, 70, 1),
//     primaryIconsColor: const Color.fromRGBO(116, 103, 99, 1),
//     primaryTextColor: Colors.white,
//   );

//   static final _lightColors = AppColors(
//     primaryBgColor: Color.fromARGB(255, 204, 124, 204),
//     primaryBtnColor: Color.fromARGB(255, 144, 100, 0),
//     primaryHeartColor: Color.fromARGB(255, 216, 6, 6),
//     primaryStarColor: Color.fromARGB(255, 255, 213, 60),
//     primaryAppBarColor: Color.fromARGB(75, 159, 8, 0),
//     primaryInputColor: Color.fromARGB(255, 244, 108, 244),
//     primaryContainerColor: const Color.fromRGBO(55, 44, 54, 1),
//     secondaryContainerColor: const Color.fromRGBO(70, 61, 70, 1),
//     primaryIconsColor: const Color.fromRGBO(116, 103, 99, 1),
//     primaryTextColor: Colors.white,
//   );

//   static AppColors get colors => isDarkTheme ? _darkColors : _lightColors;
//   //  AppColors(
//   //   primaryBgColor: const Color.fromRGBO(32, 21, 32, 1),
//   //   primaryBtnColor: const Color.fromRGBO(239, 227, 200, 1),
//   //   primaryHeartColor: const Color.fromRGBO(201, 76, 76, 1),
//   //   primaryStarColor: const Color.fromRGBO(211, 166, 1, 1),
//   //   primaryAppBarColor: const Color.fromRGBO(112, 67, 65, 0.3),
//   //   primaryInputColor: const Color.fromRGBO(23, 16, 23, 1),
//   //   primaryContainerColor: const Color.fromRGBO(55, 44, 54, 1),
//   //   secondaryContainerColor: const Color.fromRGBO(70, 61, 70, 1),
//   //   primaryIconsColor: const Color.fromRGBO(116, 103, 99, 1),
//   //   primaryTextColor: Colors.white,
//   // );

//   static ThemeData buildTheme(bool isDarkTheme, BuildContext context) {
//     AppTheme.isDarkTheme = isDarkTheme;
//     return ThemeData(
//       scaffoldBackgroundColor: colors.primaryBgColor,
//       cardColor: colors.primaryContainerColor,
//       appBarTheme: AppBarTheme(
//         backgroundColor: colors.primaryAppBarColor,
//         titleTextStyle: GoogleFonts.rosarivo(
//           color: colors.primaryBtnColor,
//           fontSize: 20,
//         ),
//       ),
//       buttonTheme: ButtonThemeData(
//         buttonColor: colors.primaryBtnColor,
//       ),
//       textTheme: Theme.of(context)
//           .textTheme
//           .merge(GoogleFonts.rosarivoTextTheme())
//           .apply(bodyColor: colors.primaryBtnColor),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ButtonStyle(
//           side: MaterialStateProperty.all(
//             BorderSide(
//               width: 1,
//               color: colors.primaryBtnColor,
//             ),
//           ),
//           textStyle: MaterialStateProperty.all(
//             GoogleFonts.rosarivo(
//               color: colors.primaryBtnColor,
//               fontSize: 14,
//             ),
//           ),
//           backgroundColor: MaterialStateProperty.all(colors.primaryBgColor),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    //  primaryBgColor: const Color.fromRGBO(32, 21, 32, 1),
    //   primaryBtnColor: const Color.fromRGBO(239, 227, 200, 1),
    //   primaryHeartColor: const Color.fromRGBO(201, 76, 76, 1),
    //   primaryStarColor: const Color.fromRGBO(211, 166, 1, 1),
    //   primaryAppBarColor: const Color.fromRGBO(112, 67, 65, 0.3),
    //   primaryInputColor: const Color.fromRGBO(23, 16, 23, 1),
    //   primaryContainerColor: const Color.fromRGBO(55, 44, 54, 1),
    //   secondaryContainerColor: const Color.fromRGBO(70, 61, 70, 1),
    //   primaryIconsColor: const Color.fromRGBO(116, 103, 99, 1),
    //   primaryTextColor: Colors.white,
    return ThemeData(
      primaryColor: isDarkTheme
          ? const Color.fromRGBO(55, 44, 54, 1) // primaryContainerColor
          : const Color.fromARGB(255, 177, 153, 143),
      scaffoldBackgroundColor: isDarkTheme
          ? const Color.fromRGBO(32, 21, 32, 1) // bg Color
          : Colors.brown[100],
      secondaryHeaderColor: isDarkTheme
          ? const Color.fromRGBO(239, 227, 200, 1) //primaryBtnColor
          : const Color.fromARGB(255, 0, 0, 0),

      splashColor: isDarkTheme
          ? const Color.fromRGBO(201, 76, 76, 1)
          : const Color.fromARGB(255, 114, 49, 49), // primaryHeartColor
      cardColor: isDarkTheme //
          ? const Color.fromRGBO(112, 67, 65, 0.3) // primaryAppBarColor
          : Colors.brown[400],
      canvasColor: isDarkTheme
          ? const Color.fromRGBO(23, 16, 23, 1) //primaryInputColor
          : const Color.fromARGB(255, 103, 89, 103),
      hintColor: isDarkTheme
          ? const Color.fromRGBO(70, 61, 70, 1) //secondaryContainerColor
          : const Color.fromARGB(255, 118, 104, 118),

      highlightColor: isDarkTheme
          ? const Color.fromRGBO(116, 103, 99, 1) //primaryIconsColor
          : Colors.brown[200],
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
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
