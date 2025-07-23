import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
// import 'package:smart_shop/features/cart/viewmodels/cart_viewmodel.dart';
// import 'package:smart_shop/features/products/viewmodels/product_viewmodel.dart';
// import 'package:smart_shop/models/product.dart';

import '../../../models/product.dart';
import '../../cart/viewmodels/cart_viewmodel.dart';
import '../viewmodels/product_viewmodel.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Providers for interacting with cart and product states
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);

    return Card(
      clipBehavior: Clip.antiAlias, // Ensures the image respects the card's border radius
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Product Image and Favorite Icon
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                // Product Image
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error_outline, size: 40);
                    },
                  ),
                ),
                // Favorite Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: Consumer<ProductViewModel>(
                    builder: (context, viewModel, child) {
                      // We get the specific product from the provider to ensure its favorite status is up-to-date
                      final p = viewModel.products.firstWhere((e) => e.id == product.id);
                      return IconButton(
                        icon: Icon(
                          p.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          productViewModel.toggleFavoriteStatus(product.id);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Product Details
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),

                  // Rating Bar and Count
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: product.rating.rate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) {},
                        ignoreGestures: true,
                      ),
                      const SizedBox(width: 4),
                      Text('(${product.rating.count})'),
                    ],
                  ),
                  const Spacer(),

                  // Price
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Spacer(),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cartViewModel.addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.title} added to cart!'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text('Add to Cart'),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}