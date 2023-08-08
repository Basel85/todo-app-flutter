import 'package:flutter/material.dart';
import 'package:todo/theme.dart';
import '../../../constants/keys.dart';
class AppBarTask extends StatelessWidget implements PreferredSizeWidget {
  final String assetImagePath;
  final bool isHomePage;
  final String appBarTitle;
  const AppBarTask({super.key, required this.assetImagePath, required this.isHomePage, this.appBarTitle=""});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
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
      onPressed: () {
        Keys.navigatorKey.currentState!.pop();
      },
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
}
