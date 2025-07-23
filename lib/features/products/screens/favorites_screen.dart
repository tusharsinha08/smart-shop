import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:smart_shop/features/products/viewmodels/product_viewmodel.dart';

import '../viewmodels/product_viewmodel.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Consumer to get the list of favorite products from the ProductViewModel
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
        final favoriteProducts = viewModel.favoriteProducts;

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Favorites'),
          ),
          body: favoriteProducts.isEmpty
              ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                SizedBox(height: 20),
                Text(
                  'No favorite items yet!',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          )
              : ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      // Unfavorite the item directly from this screen
                      viewModel.toggleFavoriteStatus(product.id);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}