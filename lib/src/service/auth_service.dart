import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  /// check auth
  ///
  ///
  Future<String?> checkAuth() async {
    _isAuthenticated = true;
    notifyListeners();
    return null;
  }

  /// login
  ///
  ///
  Future<String?> login() async {
    return null;
  }

  /// logout
  ///
  Future<String?> logout() async {
    return null;
  }
}
