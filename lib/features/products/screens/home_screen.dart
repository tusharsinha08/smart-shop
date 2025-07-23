import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:smart_shop/features/cart/viewmodels/cart_viewmodel.dart';
// import 'package:smart_shop/features/products/viewmodels/product_viewmodel.dart';
// import 'package:smart_shop/features/products/widgets/product_card.dart';
// import 'package:smart_shop/routes.dart';
// import 'package:smart_shop/shared/widgets/custom_drawer.dart';

import '../../../routes.dart';
import '../../../shared/widgets/custom_drawer.dart';
import '../../cart/viewmodels/cart_viewmodel.dart';
import '../viewmodels/product_viewmodel.dart';
import '../widgets/product_card.dart';

// Enum for sorting options to make the code more readable and maintainable
enum SortOption { priceLowToHigh, priceHighToLow, rating }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch products after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  void _onSort(SortOption option) {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.sortProducts(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(), // We will create this widget later
      appBar: AppBar(
        title: const Text('Smart Shop'),
        actions: [
          // Cart Icon with Badge
          Consumer<CartViewModel>(
            builder: (context, cart, child) {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeContent: Text(
                  cart.itemCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                showBadge: cart.itemCount > 0,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
                ),
              );
            },
          ),
          // Sorting Menu
          PopupMenuButton<SortOption>(
            onSelected: _onSort,
            icon: const Icon(Icons.sort),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
              const PopupMenuItem<SortOption>(
                value: SortOption.priceLowToHigh,
                child: Text('Price: Low to High'),
              ),
              const PopupMenuItem<SortOption>(
                value: SortOption.priceHighToLow,
                child: Text('Price: High to Low'),
              ),
              const PopupMenuItem<SortOption>(
                value: SortOption.rating,
                child: Text('By Rating'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.fetchProducts(),
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: viewModel.products.length,
              itemBuilder: (context, index) {
                final product = viewModel.products[index];
                // We will create the ProductCard next
                return ProductCard(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}