import 'package:kiwi/presentation/shared/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class UITheme {
  static get appTheme {
    return ThemeData(
      useMaterial3: true,
      splashFactory: InkSplash.splashFactory,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: UIColor.black,
        selectionColor: UIColor.primary,
        selectionHandleColor: UIColor.primary,
      ),
      colorScheme: const ColorScheme.light(
        primary: UIColor.black,
        secondary: UIColor.primary,
        onPrimary: UIColor.primary,
        onSecondary: UIColor.primary,
      ),
      scaffoldBackgroundColor: UIColor.background,
      fontFamily: GoogleFonts.roboto().fontFamily,
      appBarTheme: AppBarTheme(
        surfaceTintColor: UIColor.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: UIColor.black,
        ),
        iconTheme: const IconThemeData(
          color: UIColor.black,
        ),
        backgroundColor: UIColor.background,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: UIColor.background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: GoogleFonts.roboto(),
          tabLabelTextStyle: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
