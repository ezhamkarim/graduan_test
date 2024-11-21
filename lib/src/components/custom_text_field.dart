import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:graduan_test/src/helper/helper.dart';

class CustomeTextField extends StatefulWidget {
  const CustomeTextField({
    super.key,
    required this.textEditingController,
    this.obscureText,
    this.validator,
  });
  final TextEditingController textEditingController;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();

    isObscure = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      controller: widget.textEditingController,
      validator: widget.validator ?? ValidatorHelper.generalValidator,
      decoration: InputDecoration(
          suffixIcon: isObscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: FaIcon(
                    isObscure
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    color: Colors.black,
                  ))
              : null,
          // hintText: widget.hintText,
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
