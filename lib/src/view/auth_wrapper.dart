import 'package:flutter/material.dart';
import 'package:graduan_test/src/enum/enum.dart';
import 'package:graduan_test/src/service/service.dart';
import 'package:graduan_test/src/service_locator.dart';
import 'package:graduan_test/src/view/home_view.dart';
import 'package:graduan_test/src/view/login_view.dart';

class AuthWrapperView extends StatelessWidget {
  const AuthWrapperView({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final authService = getService<AuthService>();

    return ListenableBuilder(
        listenable: authService,
        builder: (_, __) {
          if (authService.viewState == ViewState.busy) {
            return const Scaffold(
              body: _LoadingView(),
            );
          }
          if (!authService.isAuthenticated) {
            return const LoginView();
          }
          return const HomeView();
        });
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Loading',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: Colors.blue[400],
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
