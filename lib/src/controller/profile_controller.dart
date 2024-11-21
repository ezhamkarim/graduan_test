import 'package:flutter/material.dart';
import 'package:graduan_test/src/helper/helper.dart';
import 'package:graduan_test/src/model/profile.dart';

import '../enum/enum.dart';
import '../service/service.dart';
import '../service_locator.dart';

class ProfileController with ChangeNotifier {
  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  Profile? _profile;

  Profile? get profile => _profile;
  final _apiService = getService<APIServices>();

  final formKey = GlobalKey<FormState>();

  final nameTEController = TextEditingController();

  final emailTEController = TextEditingController();

  final emailVerifiedTEController = TextEditingController();

  void _assignToTextEditingController(Profile profile) {
    nameTEController.text = profile.name;
    emailTEController.text = profile.email;
    emailVerifiedTEController.text = profile.email_verified_at;
  }

  Future<String?> get() async {
    try {
      var result = await _apiService.get('/dashboard/profile');

      _profile = Profile.fromMap(result);

      _assignToTextEditingController(_profile!);
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<String?> update() async {
    try {
      _viewState = ViewState.busy;

      if (_profile == null) return 'Profile Not Found';

      _profile?.name = nameTEController.text;

      var result = await _apiService.put(
        path: '/dashboard/profile',
        body: _profile!.toMapPut(),
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
