import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduan_test/src/controller/controller.dart';
import 'package:graduan_test/src/enum/enum.dart';
import 'package:graduan_test/src/extensions/list.dart';
import 'package:graduan_test/src/helper/dialog_helper.dart';
import 'package:graduan_test/src/service/auth_service.dart';
import 'package:graduan_test/src/service_locator.dart';
import 'package:graduan_test/src/view/view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    var controller = context.read<PostController>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await controller.get();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authService = getService<AuthService>();
    return Scaffold(
        body: Consumer<PostController>(builder: (_, controller, __) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator.adaptive(
          onRefresh: () => controller.get(),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Post',
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.of(context)
                              .pushNamed(CreatePostView.routeName);

                          await controller.get();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[400]),
                        child: const Text(
                          'Create',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Consumer<ProfileController>(
                          builder: (_, pController, __) {
                        return IconButton(
                          onPressed: () {
                            pController.get();
                            Navigator.of(context)
                                .pushNamed(ProfileView.routeName);
                          },
                          icon: const FaIcon(FontAwesomeIcons.circleUser),
                        );
                      }),
                      IconButton(
                          onPressed: () async {
                            await DialogHelper.dialogWithAction(
                                context, 'Logout', 'Are you sure to logout',
                                onPressed: () async {
                              await authService.logout();
                            });
                          },
                          icon: const FaIcon(
                              FontAwesomeIcons.arrowRightFromBracket))
                    ],
                  )
                ],
              ),
              controller.viewState == ViewState.busy
                  ? const Center(
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator()),
                    )
                  : controller.posts.isEmpty
                      ? const Text('No Posts')
                      : ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.posts.length,
                          itemBuilder: (_, i) {
                            var post = controller.posts[i];
                            return ListTile(
                              title: Text(post.title),
                            );
                          }),
            ]..separatorListWidget(const SizedBox(
                height: 8,
              )),
          ),
        ),
      );
    }));
  }
}
