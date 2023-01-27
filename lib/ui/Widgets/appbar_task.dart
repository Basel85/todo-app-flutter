import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

PreferredSizeWidget appBarTask(String assetImagePath,bool isHomePage,{String appBarTitle=""}){
  return AppBar(
    title: Text(
      appBarTitle,
      style: Themes.headingStyle,
    ),
    leading: !isHomePage
        ? IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 24,
        color: primary,
      ),
      onPressed: () {},
    )
        : null,
    elevation: 0,
    backgroundColor: white,
    actions:  [
      CircleAvatar(
        backgroundImage: AssetImage(assetImagePath),
        radius: 24,
      ),
      const SizedBox(
        width: 20,
      )
    ],
  );
}
