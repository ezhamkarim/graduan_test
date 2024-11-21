import 'package:flutter/material.dart';
import 'package:graduan_test/src/components/components.dart';
import 'package:graduan_test/src/controller/controller.dart';
import 'package:graduan_test/src/extensions/list.dart';
import 'package:graduan_test/src/helper/dialog_helper.dart';
import 'package:graduan_test/src/model/post.dart';
import 'package:provider/provider.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});
  static const routeName = '/create-post';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostController>(builder: (_, controller, ___) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              Form(
                key: controller.formKey,
                child: CustomTextField(
                  textEditingController: controller.teController,
                  hintText: 'Title',
                ),
              ),
              CustomButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    await controller
                        .create(Post(
                            id: 0,
                            title: controller.teController.text,
                            created_at: '',
                            updated_at: ''))
                        .catchError((e) {
                      if (context.mounted) {
                        DialogHelper.dialogWithOutActionWarning(
                          context,
                          'Fail to create post',
                        );
                      }
                    }).then((val) {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    });
                  }
                },
                bgColor: Colors.blue[400],
                viewState: controller.viewState,
                child: const Text('Create Post'),
              ),
            ]..separatorListWidget(const SizedBox(
                height: 8,
              )),
          ),
        );
      }),
    );
  }
}
