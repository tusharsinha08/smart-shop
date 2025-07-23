import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:smart_shop/features/cart/viewmodels/cart_viewmodel.dart';

import '../viewmodels/cart_viewmodel.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a Consumer to listen for changes in the CartViewModel
    return Consumer<CartViewModel>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
          ),
          body: cart.items.isEmpty
              ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                SizedBox(height: 20),
                Text(
                  'Your cart is empty!',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          )
              : Column(
            children: [
              // List of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final product = cart.items[index];
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
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () {
                            // Remove item from cart
                            cart.removeItem(product.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.title} removed from cart'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Total price and checkout button
              _buildTotalPriceCard(context, cart),
            ],
          ),
        );
      },
    );
  }

  // A helper widget for the total price section
  Widget _buildTotalPriceCard(BuildContext context, CartViewModel cart) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '\$${cart.totalPrice.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Placeholder for checkout logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout feature is not implemented.')),
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}