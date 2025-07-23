import 'package:flutter/foundation.dart';
// import 'package:smart_shop/models/product.dart';

import '../../../models/product.dart';

class CartViewModel extends ChangeNotifier {
  // Using a Map to store items allows for quick lookups and prevents duplicates.
  // The key is the product's ID, and the value is the Product object.
  final Map<int, Product> _items = {};

  // Public getter to return the cart items as a list
  List<Product> get items => _items.values.toList();

  // Public getter for the number of unique items in the cart
  int get itemCount => _items.length;

  // Public getter to calculate the total price of all items in the cart
  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, product) {
      total += product.price;
    });
    return total;
  }

  // Adds a product to the cart.
  void addItem(Product product) {
    // If the item is already in the cart, you could increase its quantity.
    // For this app, we'll just ensure it's added once.
    if (!_items.containsKey(product.id)) {
      _items[product.id] = product;
      // Notify listeners to update the UI (like the cart badge)
      notifyListeners();
    }
  }

  // Removes a product from the cart using its ID.
  void removeItem(int productId) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
      notifyListeners();
    }
  }

  // Clears all items from the cart.
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}