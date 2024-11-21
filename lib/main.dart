import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduan_test/src/service/auth_service.dart';

import 'src/app.dart';
import 'src/service_locator.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  var authService = getService<AuthService>();

  authService.checkAuth();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
