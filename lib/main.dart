import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartshop/providers/theme_provider.dart';
import 'package:smartshop/routes.dart';
import 'features/auth/screens/splash_screen.dart';
import 'features/auth/viewmodels/auth_viewmodel.dart';
import 'features/cart/viewmodels/cart_viewmodel.dart';
import 'features/products/viewmodels/product_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // If ThemeProvider uses SharedPreferences or async init, wait for that
  final themeProvider = ThemeProvider();
  await themeProvider.initialize(); // Ensure this is `Future<void> initialize()`

  runApp(MyApp(themeProvider: themeProvider));
}

class MyApp extends StatelessWidget {
  final ThemeProvider themeProvider;

  const MyApp({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'Smart Shop',
            debugShowCheckedModeBanner: false,
            theme: theme.currentTheme,
            home: const SplashScreen(),
            routes: AppRoutes.getRoutes(),
          );
        },
      ),
    );
  }
}
