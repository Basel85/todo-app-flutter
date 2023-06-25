import 'package:flutter/material.dart';
import 'package:todo/enums.dart';
import 'package:todo/theme.dart';
import 'package:todo/ui/Widgets/text_form_field_selection.dart';
class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;
  final FormFieldType formFieldType;
  final bool readOnly;

  const InputField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.widget,
      this.formFieldType = FormFieldType.normal,
      this.readOnly = false});

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
            child: Row(
              children: [
                Expanded(
                  child: TextFormFieldSelection(hintText: hintText, controller: controller, formFieldType: formFieldType, readOnly: readOnly),
                ),
                widget ?? Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
