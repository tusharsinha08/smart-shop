import 'package:flutter/material.dart';

class AppConstants {
  // PADDING & MARGINS
  static const double kPaddingSmall = 4.0;
  static const double kPaddingMedium = 8.0;
  static const double kPaddingLarge = 16.0;
  static const double kPaddingExtraLarge = 24.0;

  // BORDER RADIUS
  static const double kRadiusSmall = 4.0;
  static const double kRadiusMedium = 8.0;
  static const double kRadiusLarge = 16.0;

  // ICON SIZES
  static const double kIconSizeSmall = 18.0;
  static const double kIconSizeMedium = 24.0;
  static const double kIconSizeLarge = 32.0;

  // ANIMATION DURATIONS
  static const Duration kAnimationDurationShort = Duration(milliseconds: 200);
  static const Duration kAnimationDurationMedium = Duration(milliseconds: 400);

  // SharedPreferences Keys
  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyIsDarkMode = 'isDarkMode';
  static const String keyFavoriteProductIds = 'favoriteProductIds';
}