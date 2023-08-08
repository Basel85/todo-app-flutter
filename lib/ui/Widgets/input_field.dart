import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final Widget textField;

  const InputField(
      {super.key,required this.title,required this.textField});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Themes.titleStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primary)),
            child: textField,
          ),
        ],
      ),
    );
  }
}
