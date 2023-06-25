import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool readOnly;
  const CustomTextFormField({super.key, this.controller, required this.hintText, required this.readOnly});

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