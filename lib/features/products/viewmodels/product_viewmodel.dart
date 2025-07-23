import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/product.dart';
import '../screens/home_screen.dart';
//import 'package:smart_shop/features/products/screens/home_screen.dart';
//import 'package:smart_shop/models/product.dart';

class ProductViewModel extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  // An unaltered copy of the products for resetting sort
  List<Product> _originalProducts = [];

  // Public getters
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Product> get favoriteProducts => _products.where((p) => p.isFavorite).toList();

  // Fetches products from the API
  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> productJson = json.decode(response.body);
        _products = productJson.map((json) => Product.fromJson(json)).toList();
        _originalProducts = List.from(_products); // Create a copy for sorting
        await _loadFavorites(); // Load favorite statuses after fetching
      } else {
        _errorMessage = 'Failed to load products. Status code: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Toggles the favorite status of a product
  Future<void> toggleFavoriteStatus(int productId) async {
    try {
      final productIndex = _products.indexWhere((p) => p.id == productId);
      if (productIndex != -1) {
        _products[productIndex].isFavorite = !_products[productIndex].isFavorite;
        await _saveFavorites();
        notifyListeners();
      }
    } catch (e) {
      // Handle potential errors, e.g., product not found
    }
  }

  // Saves the list of favorite product IDs to SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = favoriteProducts.map((p) => p.id.toString()).toList();
    await prefs.setStringList('favoriteProductIds', favoriteIds);
  }

  // Loads favorite statuses from SharedPreferences and applies them
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favoriteProductIds') ?? [];
    for (var product in _products) {
      if (favoriteIds.contains(product.id.toString())) {
        product.isFavorite = true;
      } else {
        product.isFavorite = false; // Ensure it's false if not in the list
      }
    }
  }

  // Sorts the product list based on the selected option
  void sortProducts(SortOption option) {
    switch (option) {
      case SortOption.priceLowToHigh:
        _products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceHighToLow:
        _products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.rating:
        _products.sort((a, b) => b.rating.rate.compareTo(a.rating.rate));
        break;
    }
    notifyListeners();
  }
}