import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme_extension.dart';

class AppTheme {
  static const primaryBlue = Color(0xFF0056D2);
  static const skyBlue = Color(0xFFE3F2FD);
  static const lightBlue = Color(0xFF42A5F5);
  static const darkBlue = Color(0xFF0D47A1);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      primary: primaryBlue,
      secondary: lightBlue,
      surface: Colors.white,
      background: const Color(0xFFF8FAFC),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Color(0xFF1E293B)),
      titleTextStyle: TextStyle(
        color: Color(0xFF1E293B),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue.withOpacity(0.1)),
      ),
      color: Colors.white,
    ),
    extensions: const [
      AppThemeExtension(
        brandColor: primaryBlue,
        cardRadius: 16.0,
        elevation: 2.0,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightBlue,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    extensions: const [
      AppThemeExtension(
        brandColor: lightBlue,
        cardRadius: 16.0,
        elevation: 2.0,
      ),
    ],
  );
}
