import 'package:flutter/material.dart';
import 'package:graduan_test/src/components/components.dart';
import 'package:graduan_test/src/controller/controller.dart';
import 'package:graduan_test/src/extensions/list.dart';
import 'package:provider/provider.dart';

import '../helper/dialog_helper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = '/profile-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileController>(builder: (_, controller, __) {
        return Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 32),
                    )
                  ]..separatorListWidget(const SizedBox(width: 12)),
                ),
                CustomTextField(
                  textEditingController: controller.nameTEController,
                  hintText: 'Name',
                ),
                CustomTextField(
                  textEditingController: controller.emailTEController,
                  hintText: 'Email',
                  enabled: false,
                ),
                CustomTextField(
                  textEditingController: controller.emailVerifiedTEController,
                  hintText: 'Email Verified At',
                  enabled: false,
                ),
                CustomButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      await controller.update().then((e) {
                        if (context.mounted) {
                          DialogHelper.dialogWithOutActionWarning(
                            context,
                            e == null
                                ? 'Successfully update profile'
                                : 'Fail to update profile',
                          );
                        }
                      });
                    }
                  },
                  bgColor: Colors.blue[400],
                  viewState: controller.viewState,
                  child: const Text('Update'),
                )
              ].separatorListWidget(const SizedBox(
                height: 12,
              )),
            ),
          ),
        );
      }),
    );
  }
}
