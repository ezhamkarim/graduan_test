import 'package:flutter/material.dart';
import 'package:graduan_test/src/service/auth_service.dart';

import 'src/app.dart';
import 'src/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  var authService = getService<AuthService>();

  authService.checkAuth();

  runApp(const MyApp());
}
