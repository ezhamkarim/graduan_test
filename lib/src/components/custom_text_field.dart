import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:graduan_test/src/helper/helper.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.textEditingController,
    this.obscureText,
    this.validator,
    required this.hintText,
  });
  final TextEditingController textEditingController;
  final String hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: textEditingController,
      validator: validator ?? ValidatorHelper.generalValidator,
      decoration: InputDecoration(
          hintText: hintText,
          disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.5), width: 2),
              borderRadius: const SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 16, cornerSmoothing: 0.6))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 16, cornerSmoothing: 0.6))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade800, width: 2),
              borderRadius: const SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 16, cornerSmoothing: 0.6))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 16, cornerSmoothing: 0.6))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 16, cornerSmoothing: 0.6)))),
    );
  }
}
