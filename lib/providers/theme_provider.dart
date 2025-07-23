import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:smart_shop/core/themes/app_themes.dart';

import '../core/themes/app_themes.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _currentTheme;
  late bool _isDarkMode;

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    // Set a default theme to avoid issues before initialization
    _currentTheme = AppThemes.lightTheme;
    _isDarkMode = false;
  }

  // Initializes the theme by loading the preference from storage
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    // Load the stored preference; defaults to false (light mode) if not set
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentTheme = _isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
    notifyListeners();
  }

  // Toggles the theme and saves the preference
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);

    notifyListeners();
  }
}