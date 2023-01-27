import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;

  const InputField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.controller,
      this.widget})
      : super(key: key);

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
          const SizedBox(height: 8,),
          Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primary)),
            child: Row(
              children: [
                Expanded(
                    child : TextFormField(
                          controller: controller,
                          style: Themes.subTitleStyle,
                          autofocus: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                              hintText: hintText,
                              hintStyle: Themes.subTitleStyle),

                        )),
                widget ?? Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
