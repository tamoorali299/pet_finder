import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF6A1B9A), // Purple
      scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Dark background for HomeScreen
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF6A1B9A),
        secondary: Color(0xFFAB47BC),
        surface: Color(0xFF2A2A2A), // Card background
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white), // Default text color
        bodyMedium: TextStyle(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6A1B9A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6A1B9A)),
        ),
        labelStyle: TextStyle(color: Colors.black54),
      ),
    );
  }
}