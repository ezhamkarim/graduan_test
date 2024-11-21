import 'package:flutter/material.dart';

import 'view/view.dart';

class GraduanRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthWrapperView.routeName:
        return MaterialPageRoute(builder: (context) => const AuthWrapperView());
      case ProfileView.routeName:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      default:
        return MaterialPageRoute(
          builder: (context) => ExceptionView(routeName: routeSettings.name!),
        );
    }
  }
}
