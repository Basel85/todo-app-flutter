import 'package:flutter/material.dart';

class CustomNonDropDownButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  const CustomNonDropDownButton({super.key, required this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
