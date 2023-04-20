import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/theme.dart';
import 'package:todo/ui/cubits/drop_down_field/drop_down_field_cubit.dart';

import '../cubits/drop_down_field/drop_down_field_states.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;
  final bool isDropDownField;
  final bool readOnly;

  const InputField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.widget,this.isDropDownField = false,this.readOnly = false});

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
                Expanded(child:isDropDownField? BlocBuilder<DropDownFieldCubit,DropDownFieldStates>(builder: ((context, _) => buildTextFormField(hintTxt: DropDownFieldCubit.get(context).selectedValue))):buildTextFormField()),
                widget ?? Container()
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField({String hintTxt = ""}) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      style: Themes.subTitleStyle,
      autofocus: false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: hintTxt.isEmpty?hintText:hintTxt,
          hintStyle: Themes.subTitleStyle),
    );
  }
}
