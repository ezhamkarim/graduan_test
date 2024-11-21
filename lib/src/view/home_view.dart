import 'package:flutter/material.dart';
import 'package:graduan_test/src/extensions/list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text(
            'Post',
            style: TextStyle(color: Colors.black, fontSize: 32),
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
