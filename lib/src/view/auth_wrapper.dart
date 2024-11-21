import 'package:flutter/material.dart';
import 'package:graduan_test/src/service/service.dart';
import 'package:graduan_test/src/service_locator.dart';

class AuthWrapperView extends StatelessWidget {
  const AuthWrapperView({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final authService = getService<AuthService>();

    return ListenableBuilder(
        listenable: authService,
        builder: (_, __) {
          return const Scaffold(
            body: _LoadingView(),
          );
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
