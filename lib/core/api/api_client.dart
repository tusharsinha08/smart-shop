import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiClient {
  // Handles GET requests
  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  // Handles POST requests
  Future<dynamic> post(String url, {required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  // Processes the HTTP response
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400: // Bad request
        throw Exception('Bad request: ${response.body}');
      case 401: // Unauthorized
      case 403: // Forbidden
        throw Exception('Unauthorized: ${response.body}');
      case 500: // Server error
      default:
        throw Exception('Error occurred with status code: ${response.statusCode}');
    }
  }
}