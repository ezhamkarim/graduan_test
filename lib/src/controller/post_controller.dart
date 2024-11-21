import 'package:flutter/material.dart';
import 'package:graduan_test/src/enum/enum.dart';

import '../model/model.dart';
import '../service/service.dart';
import '../service_locator.dart';

class PostController with ChangeNotifier {
  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  final _apiService = getService<APIServices>();

  final teController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<String?> get() async {
    try {
      _viewState = ViewState.busy;
      var post = await _apiService.get('/post');

      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _viewState = ViewState.idle;
      notifyListeners();
    }
  }

  Future<String?> create(Post post) async {
    try {
      _viewState = ViewState.busy;
      var result = await _apiService.post(
        path: '/dashboard/post',
        formData: post.toMap(),
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
