import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
      primaryColor: Color(0xFF2563EB), // Clean vibrant blue
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: const Color(0xFFFFFFFF)
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
      primaryColor: Color(0xFF2563EB), // Clean vibrant blue
      scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
    ),
      cardColor: const Color(0xFF1E1E1E)
  );
}
