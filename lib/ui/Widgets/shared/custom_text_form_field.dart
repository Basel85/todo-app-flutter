import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController? controller;
  final String hintText;
  const CustomTextFormField({super.key, this.readOnly = false, this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      style: Themes.subTitleStyle,
      autofocus: false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: Themes.subTitleStyle),
    );
  }
}
