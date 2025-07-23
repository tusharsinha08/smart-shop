import 'package:flutter/widgets.dart';
// import 'package:smart_shop/features/auth/screens/login_screen.dart';
// import 'package:smart_shop/features/cart/screens/cart_screen.dart';
// import 'package:smart_shop/features/products/screens/favorites_screen.dart';
// import 'package:smart_shop/features/products/screens/home_screen.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/cart/screens/cart_screen.dart';
import 'features/products/screens/favorites_screen.dart';
import 'features/products/screens/home_screen.dart';

class AppRoutes {
  // Route names
  static const String login = '/login';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String favorites = '/favorites';
  // You can add more routes here, e.g., for a profile screen
  // static const String profile = '/profile';

  // Method to get all the routes
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      home: (context) => const HomeScreen(),
      cart: (context) => const CartScreen(),
      favorites: (context) => const FavoritesScreen(),
      // profile: (context) => const ProfileScreen(),
    };
  }
}