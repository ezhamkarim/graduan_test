import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduan_test/src/extensions/list.dart';
import 'package:graduan_test/src/view/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(CreatePostView.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[400]),
                    child: const Text(
                      'Create',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProfileView.routeName);
                    },
                    icon: const FaIcon(FontAwesomeIcons.circleUser),
                  )
                ],
              )
            ],
          ),

          // ListView.builder(
          //   itemCount: ,
          //   itemBuilder: (_,__){

          // }),
        ]..separatorListWidget(const SizedBox(
            height: 8,
          )),
      ),
    ));
  }
}
