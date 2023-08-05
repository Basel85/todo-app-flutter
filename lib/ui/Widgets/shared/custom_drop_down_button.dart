import 'package:flutter/material.dart';

import '../../../theme.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<dynamic> dropDownMenuItems;
  final Function(Object?)? onChanged;
  const CustomDropDownButton(
      {super.key, required this.dropDownMenuItems, this.onChanged});

  @override
  Widget build(BuildContext context) {
    debugPrint("Drop Down Button");
    return DropdownButton(
      items: dropDownMenuItems
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(
                  "$value",
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
      iconSize: 32,
      elevation: 4,
      underline: Container(
        height: 0,
      ),
      style: Themes.subTitleStyle,
    );
  }
}
