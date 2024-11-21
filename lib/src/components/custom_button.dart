// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../enum/enum.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.bgColor,
    required this.viewState,
  });
  final VoidCallback onPressed;
  final Widget child;
  final Color? bgColor;
  final ViewState viewState;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: viewState == ViewState.busy ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.blue[400],
      ),
      child: viewState == ViewState.busy
          ? const CircularProgressIndicator()
          : child,
    );
  }
}
