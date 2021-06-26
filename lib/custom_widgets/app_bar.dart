import 'package:bloc_pattern_demo/commons/gloable.dart';
import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const CustomAppBar({Key? key, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: appTheme.iconTheme(context),
      title: Text(
        title ?? '',
        style: TextStyle(
          color: appTheme.textColor(context),
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'Noir'
        ),
      ),
      actions: actions ?? [],
      elevation: 0,
      centerTitle: false,
      backgroundColor: appTheme.backgroundColor(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
