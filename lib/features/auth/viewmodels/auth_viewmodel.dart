import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Login method that communicates with the FakeStoreAPI
  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', token);

        _isLoading = false;
        notifyListeners();
        return true;
      } else if (response.statusCode == 401) {
        _errorMessage = 'Invalid username or password.';
      } else {
        try {
          final data = json.decode(response.body);
          _errorMessage = data['msg'] ?? 'Unexpected error occurred.';
        } catch (_) {
          _errorMessage = 'Unexpected error occurred.';
        }
      }
    } on SocketException {
      _errorMessage = 'No internet connection.';
    } on http.ClientException catch (e) {
      _errorMessage = 'Client error: ${e.message}';
    } catch (e) {
      _errorMessage = 'Something went wrong: ${e.toString()}';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Logout method
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }
}
