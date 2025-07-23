import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme Configuration
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      background: Colors.white,
      surface: Colors.white,
      error: Colors.red,
      onBackground: Colors.black87,
      onSurface: Colors.black87,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    useMaterial3: true, // Optional: Enables Material 3 design
  );

  // Dark Theme Configuration
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: Colors.teal,
    colorScheme: const ColorScheme.dark(
      primary: Colors.teal,
      secondary: Colors.tealAccent,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      error: Colors.redAccent,
      onBackground: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1E1E1E),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    useMaterial3: true,
  );
}
