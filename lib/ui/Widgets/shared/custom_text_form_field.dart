import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController? controller;
  final String hintText;
  final Widget suffix;
  const CustomTextFormField(
      {super.key,
      this.readOnly = false,
      this.controller,
      required this.hintText,
      required this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      readOnly: readOnly,
      controller: controller,
      style: Themes.subTitleStyle,
      textAlignVertical: TextAlignVertical.center,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: Themes.subTitleStyle,
        suffixIcon: suffix,
      ),
    );
  }
}
