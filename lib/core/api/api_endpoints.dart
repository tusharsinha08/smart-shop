class ApiEndpoints {
  static const String baseUrl = 'https://fakestoreapi.com';

  static String get products => '$baseUrl/products';
  static String get login => '$baseUrl/auth/login';

// You can add other endpoints here as your app grows
// static String get categories => '$baseUrl/products/categories';
// static String getProductsByCategory(String category) => '$baseUrl/products/category/$category';
}