import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static ThemeData themeLight = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorApp.primaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        )),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorApp.primaryColor,
          primaryContainer: ColorApp.primaryColor,
          onPrimaryContainer: Colors.white,
          onSecondaryContainer: ColorApp.textColor,
          inverseSurface: const Color(0xff303030),
          onInverseSurface:const Color((0xff42505C))));
}

class ColorApp {
  static Color primaryColor = const Color(0xff39A552);
  static Color textColor = const Color(0xff42505C);
}
