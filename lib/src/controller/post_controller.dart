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

  final List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<String?> get() async {
    try {
      _viewState = ViewState.busy;
      var result = await _apiService.get('/post');

      var list = result as List;

      _posts.clear();
      for (var element in list) {
        _posts.add(Post.fromMap(element));
      }

      _posts.sort((a, b) {
        DateTime dateA = DateTime.parse(a.created_at);
        DateTime dateB = DateTime.parse(b.created_at);
        return dateB.compareTo(dateA); // Compare in reverse order
      });
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
      teController.clear();
      notifyListeners();
    }
  }
}
