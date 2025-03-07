import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? companyLogo;
  final Widget? actionButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.companyLogo,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          if (companyLogo != null) companyLogo!,
          if (companyLogo != null) SizedBox(width: 8),
          Text(title),
        ],
      ),
      actions: [
        if (actionButton != null) actionButton!,
        if (actions != null) ...actions!,
      ],
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
