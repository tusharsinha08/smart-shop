import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:smart_shop/features/auth/viewmodels/auth_viewmodel.dart';
//import 'package:smart_shop/providers/theme_provider.dart';
//import 'package:smart_shop/routes.dart';

import '../../features/auth/viewmodels/auth_viewmodel.dart';
import '../../providers/theme_provider.dart';
import '../../routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // We need access to multiple providers
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(
              'Smart Shop Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home_outlined,
            title: 'Home',
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
          ),
          _buildDrawerItem(
            icon: Icons.shopping_cart_outlined,
            title: 'Cart',
            onTap: () {
              Navigator.pop(context); // Close the drawer first
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
          _buildDrawerItem(
            icon: Icons.favorite_border,
            title: 'Favorites',
            onTap: () {
              Navigator.pop(context); // Close the drawer first
              Navigator.pushNamed(context, AppRoutes.favorites);
            },
          ),
          const Divider(),
          // Theme Toggle Switch
          ListTile(
            leading: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () async {
              await authViewModel.logout();
              // Clear the navigation stack and navigate to the login screen
              if (context.mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.login,
                      (Route<dynamic> route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // Helper method to reduce code duplication for drawer items
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}