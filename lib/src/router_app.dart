import 'package:flutter/material.dart';
import 'package:graduan_test/src/view/auth_wrapper.dart';

import 'view/view.dart';

class GraduanRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthWrapperView.routeName:
        return MaterialPageRoute(builder: (context) => const AuthWrapperView());
      default:
        return MaterialPageRoute(
          builder: (context) => ExceptionView(routeName: routeSettings.name!),
        );
    }
  }
}
