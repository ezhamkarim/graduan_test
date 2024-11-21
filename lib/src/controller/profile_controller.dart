import 'package:flutter/material.dart';
import 'package:graduan_test/src/model/profile.dart';

import '../enum/enum.dart';
import '../service/service.dart';
import '../service_locator.dart';

class ProfileController with ChangeNotifier {
  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  final _apiService = getService<APIServices>();

  Future<String?> get() async {
    try {
      _viewState = ViewState.busy;
      var result = await _apiService.get('/dashboard/profile');

      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _viewState = ViewState.idle;
      notifyListeners();
    }
  }

  Future<String?> update(Profile p) async {
    try {
      _viewState = ViewState.busy;
      var result = await _apiService.put(
        path: '/dashboard/profile',
        body: p.toMap(),
      );

      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _viewState = ViewState.idle;
      notifyListeners();
    }
  }
}
