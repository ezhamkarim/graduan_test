import 'package:flutter/material.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({
    super.key,
    required this.routeName,
  });
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text('Page $routeName not found'))]),
    );
  }
}
