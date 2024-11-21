import 'package:flutter/material.dart';
import 'package:graduan_test/src/enum/enum.dart';
import 'package:graduan_test/src/helper/helper.dart';
import 'package:graduan_test/src/service/service.dart';
import 'package:graduan_test/src/service_locator.dart';

import '../model/model.dart';

class AuthService with ChangeNotifier {
  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  final _apiService = getService<APIServices>();

  /// check auth
  ///
  ///
  Future<String?> checkAuth() async {
    _viewState = ViewState.busy;
    logInfo('Authentication...');

    var result = await CacheService.readCache('token');

    if (result != null) {
      _isAuthenticated = true;
    }

    logSuccess('Authenticated');

    _viewState = ViewState.idle;
    notifyListeners();
    return null;
  }

  /// login
  ///
  ///
  Future<String?> login(LoginCredential lc) async {
    try {
      _viewState = ViewState.busy;
      var login = await _apiService.post(path: '/login', formData: lc.toMap());

      var token = login["token"];

      await CacheService.updateCache('token', token);
      _isAuthenticated = true;
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _viewState = ViewState.idle;
      notifyListeners();
    }
  }

  /// logout
  ///
  Future<String?> logout() async {
    CacheService.deleteCache('token');
    return null;
  }
}
