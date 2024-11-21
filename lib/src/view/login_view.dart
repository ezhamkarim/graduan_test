import 'package:flutter/material.dart';
import 'package:graduan_test/src/components/components.dart';
import 'package:graduan_test/src/extensions/list.dart';
import 'package:graduan_test/src/helper/helper.dart';
import 'package:graduan_test/src/model/model.dart';

import '../service/service.dart';
import '../service_locator.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailEditingController = TextEditingController();
  final pwEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authService = getService<AuthService>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeTextField(
                  textEditingController: emailEditingController,
                  hintText: 'Email',
                ),
                CustomeTextField(
                  textEditingController: pwEditingController,
                  obscureText: true,
                  hintText: 'Password',
                ),
                CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await authService.login(
                        LoginCredential(
                          email: emailEditingController.text,
                          password: pwEditingController.text,
                        ),
                      );
                    }
                  },
                  bgColor: Colors.blue[400],
                  viewState: authService.viewState,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ].separatorListWidget(const SizedBox(
                height: 12,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
